import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_admin/core/graphql/graphql_client.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_controller.dart';
import 'package:pms_admin/features/housekeeping/data/housekeeping_repository.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

final housekeepingRepositoryProvider = Provider<HousekeepingRepository>((ref) {
  final graphqlClient = ref.watch(graphqlClientProvider);
  return HousekeepingRepository(graphqlClient);
});

enum HousekeepingFilter { all, dirty, cleaning, inspecting, ready }

final housekeepingFilterProvider = StateProvider<HousekeepingFilter>((ref) => HousekeepingFilter.all);

final housekeepingSearchQueryProvider = StateProvider<String>((ref) => '');

class HousekeepingController extends StateNotifier<AsyncValue<List<Query$GetRooms$rooms>>> {
  final HousekeepingRepository _repository;
  final Ref _ref;

  HousekeepingController(this._repository, this._ref) : super(const AsyncValue.loading()) {
    _init();
  }

  void _init() {
    _ref.listen(selectedPropertyProvider, (previous, next) {
      if (next != null) {
        fetchRooms(next.id);
      } else {
        state = const AsyncValue.data([]);
      }
    }, fireImmediately: true);
  }

  Future<void> fetchRooms(String propertyId) async {
    state = const AsyncValue.loading();
    try {
      final rooms = await _repository.getRooms(propertyId);
      state = AsyncValue.data(rooms);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> refresh() async {
    final selectedProperty = _ref.read(selectedPropertyProvider);
    if (selectedProperty != null) {
      // Don't show loading spinner for pull-to-refresh to avoid jar, just update the data when it arrives
      try {
        final rooms = await _repository.getRooms(selectedProperty.id);
        state = AsyncValue.data(rooms);
      } catch (e, stack) {
        state = AsyncValue.error(e, stack);
      }
      // Also refresh dashboard stats so stats updates are reflected globally
      _ref.invalidate(dashboardStatsProvider);
    }
  }

  Future<void> updateRoomStatus(String roomId, Enum$HousekeepingStatus status) async {
    try {
      await _repository.updateRoomStatus(roomId, status);
      await refresh();
    } catch (e) {
      // Let the UI catch errors if needed, but repository will throw
      rethrow;
    }
  }

  Future<void> togglePriorityCleaning(String roomId, bool priority) async {
    try {
      await _repository.togglePriorityCleaning(roomId, priority);
      await refresh();
    } catch (e) {
      rethrow;
    }
  }
}

final housekeepingControllerProvider =
    StateNotifierProvider<HousekeepingController, AsyncValue<List<Query$GetRooms$rooms>>>((ref) {
  final repository = ref.watch(housekeepingRepositoryProvider);
  return HousekeepingController(repository, ref);
});

final filteredRoomsProvider = Provider<List<Query$GetRooms$rooms>>((ref) {
  final roomsAsync = ref.watch(housekeepingControllerProvider);
  final filter = ref.watch(housekeepingFilterProvider);
  final query = ref.watch(housekeepingSearchQueryProvider).trim().toLowerCase();

  final rooms = roomsAsync.value ?? [];

  var result = rooms;

  // 1. Filter by status
  if (filter != HousekeepingFilter.all) {
    result = result.where((r) {
      switch (filter) {
        case HousekeepingFilter.dirty:
          return r.housekeepingStatus == Enum$HousekeepingStatus.DIRTY;
        case HousekeepingFilter.cleaning:
          return r.housekeepingStatus == Enum$HousekeepingStatus.CLEANING;
        case HousekeepingFilter.inspecting:
          return r.housekeepingStatus == Enum$HousekeepingStatus.INSPECTING;
        case HousekeepingFilter.ready:
          return r.housekeepingStatus == Enum$HousekeepingStatus.READY;
        default:
          return true;
      }
    }).toList();
  }

  // 2. Filter by search query
  if (query.isNotEmpty) {
    result = result.where((r) {
      final roomNo = r.roomNumber.toLowerCase();
      final roomType = (r.RoomType?.name ?? '').toLowerCase();
      return roomNo.contains(query) || roomType.contains(query);
    }).toList();
  }

  // 3. Sort priority cleaning to the top
  result = List.from(result)
    ..sort((a, b) {
      if (a.priorityCleaning == b.priorityCleaning) {
        // Natural sort by room number
        return a.roomNumber.compareTo(b.roomNumber);
      }
      return a.priorityCleaning ? -1 : 1;
    });

  return result;
});
