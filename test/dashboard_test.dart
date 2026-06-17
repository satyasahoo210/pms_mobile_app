import 'package:flutter_test/flutter_test.dart';
import 'package:pms_admin/features/dashboard/domain/dashboard_models.dart';
import 'package:pms_admin/features/dashboard/data/dashboard_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MockDashboardRepository extends DashboardRepository {
  MockDashboardRepository() : super(GraphQLClient(link: Link.from([]), cache: GraphQLCache()));

  @override
  Future<DashboardStats> getStats(String propertyId) async {
    return DashboardStats(
      occupiedRooms: 15,
      availableRooms: 35,
      dirtyRooms: 5,
      maintenanceRooms: 1,
      totalRooms: 56,
      occupancyPercentage: 30.0,
      arrivalsToday: 5,
      departuresToday: 2,
      pendingPayments: 4,
      revenueSummary: 50000.0,
      staffCount: 8,
    );
  }

  @override
  Future<List<ArrivalInfo>> getUpcomingArrivals(String propertyId) async {
    return [
      ArrivalInfo(
        guestName: 'Rahul Test',
        roomNumber: '101',
        roomType: 'Deluxe',
        eta: '12:00 PM',
        isPrepaid: true,
      ),
    ];
  }
}

void main() {
  late MockDashboardRepository repository;

  setUp(() {
    repository = MockDashboardRepository();
  });

  test('Mock repository returns correct stats', () async {
    final stats = await repository.getStats('prop_id');
    expect(stats.occupiedRooms, 15);
    expect(stats.availableRooms, 35);
    expect(stats.occupancyPercentage, 30.0);
    expect(stats.revenueSummary, 50000.0);
  });

  test('Mock repository returns correct arrivals', () async {
    final arrivals = await repository.getUpcomingArrivals('prop_id');
    expect(arrivals.length, 1);
    expect(arrivals[0].guestName, 'Rahul Test');
    expect(arrivals[0].isPrepaid, true);
  });
}
