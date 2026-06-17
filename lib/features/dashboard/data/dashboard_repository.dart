import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/features/dashboard/domain/dashboard_models.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

class DashboardRepository {
  final GraphQLClient _client;

  DashboardRepository(this._client);

  Future<List<Query$GetProperties$properties>> getProperties() async {
    final result = await _client.query$GetProperties(
      Options$Query$GetProperties(
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return result.parsedData?.properties ?? [];
  }

  Future<DashboardStats> getStats(String propertyId) async {
    // 1. Fetch Rooms
    final roomsResult = await _client.query$GetRooms(
      Options$Query$GetRooms(
        variables: Variables$Query$GetRooms(propertyId: propertyId),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (roomsResult.hasException) {
      throw Exception(roomsResult.exception.toString());
    }

    final rooms = roomsResult.parsedData?.rooms ?? [];

    // 2. Fetch Bookings
    final bookingsResult = await _client.query$GetBookings(
      Options$Query$GetBookings(
        variables: Variables$Query$GetBookings(propertyId: propertyId),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (bookingsResult.hasException) {
      throw Exception(bookingsResult.exception.toString());
    }

    final bookings = bookingsResult.parsedData?.bookings ?? [];

    // 3. Fetch Users for active staff count
    final usersResult = await _client.query$GetUsers(
      Options$Query$GetUsers(
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (usersResult.hasException) {
      throw Exception(usersResult.exception.toString());
    }

    final users = usersResult.parsedData?.users ?? [];
    final staffCount = users.length;

    // 4. Compute Aggregates
    final totalRooms = rooms.length;
    final occupiedRooms = rooms.where((r) => r.status == Enum$RoomStatus.OCCUPIED).length;
    final availableRooms = rooms.where((r) => r.status == Enum$RoomStatus.AVAILABLE).length;
    final dirtyRooms = rooms.where((r) => r.housekeepingStatus == Enum$HousekeepingStatus.DIRTY).length;
    final maintenanceRooms = rooms.where((r) => r.status == Enum$RoomStatus.MAINTENANCE).length;

    final occupancyPercentage = totalRooms > 0 ? (occupiedRooms / totalRooms) * 100 : 0.0;

    // Filter today's arrivals & departures
    final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
    
    final arrivals = bookings.where((b) {
      final checkInStr = b.checkInDate.split('T')[0];
      return checkInStr == todayStr && b.status != Enum$BookingStatus.CANCELLED;
    }).length;

    final departures = bookings.where((b) {
      final checkOutStr = b.checkOutDate.split('T')[0];
      return checkOutStr == todayStr && b.status == Enum$BookingStatus.CHECKED_IN;
    }).length;

    // Calculate revenue (Sum of all completed payments today)
    double totalRevenue = 0.0;
    int pendingPayments = 0;

    for (final b in bookings) {
      final payments = b.Payment ?? [];
      for (final p in payments) {
        if (p == null) continue;
        final createdAt = p.createdAt;
        if (createdAt == null) continue;
        final paymentDate = createdAt.split('T')[0];
        if (paymentDate == todayStr && p.status == Enum$PaymentStatus.PAID) {
          totalRevenue += p.amount;
        }
      }
      
      // Calculate pending payments (if total amount > payments sum)
      final totalPaid = payments
          .where((p) => p != null && p.status == Enum$PaymentStatus.PAID)
          .fold<double>(0.0, (sum, p) => sum + (p?.amount ?? 0.0));
      
      final bookingTotal = b.totalAmount ?? 0.0;
      if (bookingTotal > totalPaid && b.status != Enum$BookingStatus.CANCELLED) {
        pendingPayments++;
      }
    }

    return DashboardStats(
      occupiedRooms: occupiedRooms,
      availableRooms: availableRooms,
      dirtyRooms: dirtyRooms,
      maintenanceRooms: maintenanceRooms,
      totalRooms: totalRooms,
      occupancyPercentage: occupancyPercentage,
      arrivalsToday: arrivals,
      departuresToday: departures,
      pendingPayments: pendingPayments,
      revenueSummary: totalRevenue,
      staffCount: staffCount,
    );
  }

  Future<List<ArrivalInfo>> getUpcomingArrivals(String propertyId) async {
    final result = await _client.query$GetBookings(
      Options$Query$GetBookings(
        variables: Variables$Query$GetBookings(propertyId: propertyId),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final bookings = result.parsedData?.bookings ?? [];
    final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());

    final filtered = bookings.where((b) {
      final checkInStr = b.checkInDate.split('T')[0];
      return checkInStr == todayStr && b.status == Enum$BookingStatus.CONFIRMED;
    }).toList();

    return filtered.map((b) {
      final bookingRooms = b.BookingRoom ?? [];
      String roomNo = 'TBD';
      String roomType = 'Standard Room';

      if (bookingRooms.isNotEmpty) {
        final activeRoom = bookingRooms.firstWhere(
          (br) => br != null && br.Room != null,
          orElse: () => null,
        );
        if (activeRoom != null) {
          roomNo = activeRoom.Room!.roomNumber;
          roomType = activeRoom.RoomType?.name ?? 'Standard Room';
        } else {
          final firstRoom = bookingRooms.first;
          if (firstRoom != null) {
            roomType = firstRoom.RoomType?.name ?? 'Standard Room';
          }
        }
      }

      DateTime? checkInDateTime = DateTime.tryParse(b.checkInDate);
      String etaStr = checkInDateTime != null
          ? DateFormat('hh:mm a').format(checkInDateTime.toLocal())
          : 'TBD';

      return ArrivalInfo(
        guestName: b.Guest?.name ?? 'Guest',
        roomNumber: roomNo,
        roomType: roomType,
        eta: etaStr,
        isPrepaid: b.Payment?.any((p) => p != null && p.status == Enum$PaymentStatus.PAID) ?? false,
      );
    }).toList();
  }

  Future<List<ActivityItem>> getRecentActivity(String propertyId) async {
    final result = await _client.query$GetRecentActivities(
      Options$Query$GetRecentActivities(
        variables: Variables$Query$GetRecentActivities(propertyId: propertyId),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final activities = result.parsedData?.recentActivities ?? [];

    return activities.map((act) {
      final created = DateTime.tryParse(act.createdAt);
      String timeAgo = 'Just now';
      if (created != null) {
        final diff = DateTime.now().difference(created.toLocal());
        if (diff.inMinutes < 1) {
          timeAgo = 'Just now';
        } else if (diff.inMinutes < 60) {
          timeAgo = '${diff.inMinutes} mins ago';
        } else if (diff.inHours < 24) {
          timeAgo = '${diff.inHours} hours ago';
        } else {
          timeAgo = '${diff.inDays} days ago';
        }
      }

      return ActivityItem(
        id: act.id,
        title: act.title,
        timeAgo: timeAgo,
        staffName: act.staffName,
        type: act.type,
      );
    }).toList();
  }
}
