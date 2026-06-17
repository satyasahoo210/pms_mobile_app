import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_admin/core/graphql/graphql_client.dart';
import 'package:pms_admin/features/dashboard/data/dashboard_repository.dart';
import 'package:pms_admin/features/dashboard/domain/dashboard_models.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final graphqlClient = ref.watch(graphqlClientProvider);
  return DashboardRepository(graphqlClient);
});

// Fetches the list of all properties available to the user's tenant
final propertiesProvider = FutureProvider<List<Query$GetProperties$properties>>(
  (ref) async {
    final repository = ref.watch(dashboardRepositoryProvider);
    return repository.getProperties();
  },
);

// Keeps track of the active property selected in the top bar
final selectedPropertyProvider = StateProvider<Query$GetProperties$properties?>(
  (ref) {
    // Can be set programmatically after properties are loaded
    return null;
  },
);

// Fetches statistics for the active property
final dashboardStatsProvider = FutureProvider<DashboardStats>((ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  final selectedProperty = ref.watch(selectedPropertyProvider);

  if (selectedProperty == null) {
    return DashboardStats.empty();
  }

  return repository.getStats(selectedProperty.id);
});

// Fetches upcoming arrivals for the active property
final upcomingArrivalsProvider = FutureProvider<List<ArrivalInfo>>((ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  final selectedProperty = ref.watch(selectedPropertyProvider);

  if (selectedProperty == null) {
    return [];
  }

  return repository.getUpcomingArrivals(selectedProperty.id);
});

// Fetches recent activities for the active property
final recentActivityProvider = FutureProvider<List<ActivityItem>>((ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  final selectedProperty = ref.watch(selectedPropertyProvider);

  if (selectedProperty == null) {
    return [];
  }

  return repository.getRecentActivity(selectedProperty.id);
});
