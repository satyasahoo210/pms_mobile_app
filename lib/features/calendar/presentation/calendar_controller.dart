import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_admin/core/graphql/graphql_client.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_controller.dart';
import 'package:pms_admin/features/housekeeping/data/housekeeping_repository.dart';
import 'package:pms_admin/features/dashboard/data/dashboard_repository.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';

final calendarRoomsRepositoryProvider = Provider<HousekeepingRepository>((ref) {
  final graphqlClient = ref.watch(graphqlClientProvider);
  return HousekeepingRepository(graphqlClient);
});

final calendarBookingsRepositoryProvider = Provider<DashboardRepository>((ref) {
  final graphqlClient = ref.watch(graphqlClientProvider);
  return DashboardRepository(graphqlClient);
});

class CalendarData {
  final List<Query$GetRooms$rooms> rooms;
  final List<Query$GetBookings$bookings> bookings;

  CalendarData({required this.rooms, required this.bookings});
}

final calendarStartDateProvider = StateProvider<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day).subtract(const Duration(days: 7));
});

final calendarDataProvider = FutureProvider<CalendarData>((ref) async {
  final selectedProperty = ref.watch(selectedPropertyProvider);
  if (selectedProperty == null) {
    return CalendarData(rooms: [], bookings: []);
  }

  final roomsRepo = ref.watch(calendarRoomsRepositoryProvider);
  final bookingsRepo = ref.watch(calendarBookingsRepositoryProvider);

  final results = await Future.wait([
    roomsRepo.getRooms(selectedProperty.id),
    bookingsRepo.getBookings(selectedProperty.id),
  ]);

  final rooms = results[0] as List<Query$GetRooms$rooms>;
  final bookings = results[1] as List<Query$GetBookings$bookings>;

  // Sort rooms naturally by room number
  final sortedRooms = List<Query$GetRooms$rooms>.from(rooms)
    ..sort((a, b) => a.roomNumber.compareTo(b.roomNumber));

  return CalendarData(rooms: sortedRooms, bookings: bookings);
});
