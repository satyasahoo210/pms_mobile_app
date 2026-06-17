import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_admin/core/theme/app_theme.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_controller.dart';
import 'package:pms_admin/features/housekeeping/presentation/housekeeping_controller.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

class HousekeepingScreen extends ConsumerWidget {
  const HousekeepingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;
    final isTablet = MediaQuery.of(context).size.width > 600;

    final selectedProperty = ref.watch(selectedPropertyProvider);
    final propertiesAsync = ref.watch(propertiesProvider);
    final roomsAsync = ref.watch(housekeepingControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              ),
              child: const Icon(Icons.cleaning_services, size: 18, color: Colors.white),
            ),
            const SizedBox(width: 8),
            if (propertiesAsync.isLoading)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else if (propertiesAsync.hasError)
              Text('Error loading', style: theme.textTheme.titleMedium)
            else if (selectedProperty != null)
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedProperty.id,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: theme.colorScheme.primary,
                  ),
                  onChanged: (id) {
                    if (id != null) {
                      final properties = propertiesAsync.value ?? [];
                      ref.read(selectedPropertyProvider.notifier).state =
                          properties.firstWhere((p) => p.id == id);
                    }
                  },
                  items: (propertiesAsync.value ?? []).map((p) {
                    return DropdownMenuItem<String>(
                      value: p.id,
                      child: Text(p.name),
                    );
                  }).toList(),
                ),
              )
            else
              Text('No Property', style: theme.textTheme.titleMedium),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(housekeepingControllerProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: selectedProperty == null
          ? const Center(child: Text('Select a property to view housekeeping'))
          : roomsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $err', style: TextStyle(color: ext.statusDirty)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => ref.read(housekeepingControllerProvider.notifier).refresh(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              data: (allRooms) {
                return RefreshIndicator(
                  onRefresh: () => ref.read(housekeepingControllerProvider.notifier).refresh(),
                  child: CustomScrollView(
                    slivers: [
                      // Stats Row
                      SliverPadding(
                        padding: const EdgeInsets.all(AppTheme.spacingMd),
                        sliver: SliverToBoxAdapter(
                          child: _buildStatsStrip(context, allRooms),
                        ),
                      ),
                      // Search and Filter Strip
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
                        sliver: SliverToBoxAdapter(
                          child: _buildSearchAndFilter(context, ref),
                        ),
                      ),
                      // Rooms List
                      SliverPadding(
                        padding: const EdgeInsets.all(AppTheme.spacingMd),
                        sliver: _buildRoomsList(context, ref, isTablet),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Widget _buildStatsStrip(BuildContext context, List<Query$GetRooms$rooms> rooms) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    final dirty = rooms.where((r) => r.housekeepingStatus == Enum$HousekeepingStatus.DIRTY).length;
    final cleaning = rooms.where((r) => r.housekeepingStatus == Enum$HousekeepingStatus.CLEANING).length;
    final inspecting = rooms.where((r) => r.housekeepingStatus == Enum$HousekeepingStatus.INSPECTING).length;
    final ready = rooms.where((r) => r.housekeepingStatus == Enum$HousekeepingStatus.READY).length;

    return Row(
      children: [
        Expanded(child: _buildMiniStatCard(context, 'Dirty', dirty.toString(), ext.statusDirty, Icons.warning_amber_rounded)),
        const SizedBox(width: 8),
        Expanded(child: _buildMiniStatCard(context, 'Cleaning', cleaning.toString(), theme.colorScheme.primary, Icons.cleaning_services_outlined)),
        const SizedBox(width: 8),
        Expanded(child: _buildMiniStatCard(context, 'Inspect', inspecting.toString(), ext.statusInspect, Icons.find_in_page_outlined)),
        const SizedBox(width: 8),
        Expanded(child: _buildMiniStatCard(context, 'Clean', ready.toString(), ext.statusClean, Icons.check_circle_outline)),
      ],
    );
  }

  Widget _buildMiniStatCard(
    BuildContext context,
    String label,
    String count,
    Color color,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 4),
            Text(
              count,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: ext.textPrimary,
              ),
            ),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: ext.textMuted,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchAndFilter(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;
    final selectedFilter = ref.watch(housekeepingFilterProvider);
    final searchQuery = ref.watch(housekeepingSearchQueryProvider);

    return Column(
      children: [
        // Search text field
        TextField(
          onChanged: (val) => ref.read(housekeepingSearchQueryProvider.notifier).state = val,
          decoration: InputDecoration(
            hintText: 'Search by room number or type...',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: searchQuery.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => ref.read(housekeepingSearchQueryProvider.notifier).state = '',
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusDefault),
              borderSide: BorderSide(color: ext.borderLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusDefault),
              borderSide: BorderSide(color: ext.borderLight),
            ),
            filled: true,
            fillColor: ext.surfaceContainerLowest,
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
          ),
        ),
        const SizedBox(height: 12),
        // Filter row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: HousekeepingFilter.values.map((filter) {
              final isSelected = filter == selectedFilter;
              String label = 'All';
              switch (filter) {
                case HousekeepingFilter.all:
                  label = 'All';
                  break;
                case HousekeepingFilter.dirty:
                  label = 'Dirty';
                  break;
                case HousekeepingFilter.cleaning:
                  label = 'Cleaning';
                  break;
                case HousekeepingFilter.inspecting:
                  label = 'Inspecting';
                  break;
                case HousekeepingFilter.ready:
                  label = 'Ready';
                  break;
              }

              return Padding(
                padding: const EdgeInsets.only(right: 6),
                child: FilterChip(
                  label: Text(label),
                  selected: isSelected,
                  onSelected: (selected) {
                    ref.read(housekeepingFilterProvider.notifier).state = filter;
                  },
                  selectedColor: theme.colorScheme.primary.withValues(alpha: 0.15),
                  checkmarkColor: theme.colorScheme.primary,
                  labelStyle: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? theme.colorScheme.primary : ext.textMuted,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: isSelected ? theme.colorScheme.primary : ext.borderLight,
                      width: isSelected ? 1.5 : 1,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRoomsList(BuildContext context, WidgetRef ref, bool isTablet) {
    final rooms = ref.watch(filteredRoomsProvider);

    if (rooms.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.cleaning_services, size: 48, color: Colors.grey),
              SizedBox(height: 8),
              Text('No rooms found matching filters.'),
            ],
          ),
        ),
      );
    }

    if (isTablet) {
      return SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 320,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.8,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final room = rooms[index];
            return _buildRoomCard(context, ref, room);
          },
          childCount: rooms.length,
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final room = rooms[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _buildRoomCard(context, ref, room),
          );
        },
        childCount: rooms.length,
      ),
    );
  }

  Widget _buildRoomCard(BuildContext context, WidgetRef ref, Query$GetRooms$rooms room) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    Color statusColor = ext.statusClean;
    IconData statusIcon = Icons.check_circle_outline;
    String statusText = 'READY';

    switch (room.housekeepingStatus) {
      case Enum$HousekeepingStatus.READY:
        statusColor = ext.statusClean;
        statusIcon = Icons.check_circle_outline;
        statusText = 'READY';
        break;
      case Enum$HousekeepingStatus.DIRTY:
        statusColor = ext.statusDirty;
        statusIcon = Icons.warning_amber_rounded;
        statusText = 'DIRTY';
        break;
      case Enum$HousekeepingStatus.CLEANING:
        statusColor = theme.colorScheme.primary;
        statusIcon = Icons.cleaning_services_outlined;
        statusText = 'CLEANING';
        break;
      case Enum$HousekeepingStatus.INSPECTING:
        statusColor = ext.statusInspect;
        statusIcon = Icons.find_in_page_outlined;
        statusText = 'INSPECTING';
        break;
      default:
        break;
    }

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        child: Row(
          children: [
            // Status Icon Prefix
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              ),
              child: Icon(statusIcon, color: statusColor, size: 24),
            ),
            const SizedBox(width: 16),
            // Room Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Room ${room.roomNumber}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ext.textPrimary,
                        ),
                      ),
                      if (room.priorityCleaning) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: ext.statusDirty.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                            border: Border.all(color: ext.statusDirty, width: 0.5),
                          ),
                          child: Text(
                            'PRIORITY',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: ext.statusDirty,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    room.RoomType?.name ?? 'Standard Room',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: ext.textMuted,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Small Status Pill Chip
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      statusText,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: statusColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Actions
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    room.priorityCleaning ? Icons.star : Icons.star_border,
                    color: room.priorityCleaning ? Colors.amber : ext.textMuted,
                  ),
                  onPressed: () {
                    ref
                        .read(housekeepingControllerProvider.notifier)
                        .togglePriorityCleaning(room.id, !room.priorityCleaning);
                  },
                ),
                PopupMenuButton<Enum$HousekeepingStatus>(
                  icon: Icon(Icons.more_vert, color: ext.textMuted),
                  onSelected: (status) {
                    ref
                        .read(housekeepingControllerProvider.notifier)
                        .updateRoomStatus(room.id, status);
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: Enum$HousekeepingStatus.READY,
                      child: Row(
                        children: [
                          Icon(Icons.check_circle_outline, color: Colors.green, size: 18),
                          SizedBox(width: 8),
                          Text('Ready (Clean)'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: Enum$HousekeepingStatus.CLEANING,
                      child: Row(
                        children: [
                          Icon(Icons.cleaning_services_outlined, color: Colors.blue, size: 18),
                          SizedBox(width: 8),
                          Text('Cleaning'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: Enum$HousekeepingStatus.INSPECTING,
                      child: Row(
                        children: [
                          Icon(Icons.find_in_page_outlined, color: Colors.orange, size: 18),
                          SizedBox(width: 8),
                          Text('Inspecting'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: Enum$HousekeepingStatus.DIRTY,
                      child: Row(
                        children: [
                          Icon(Icons.warning_amber_rounded, color: Colors.red, size: 18),
                          SizedBox(width: 8),
                          Text('Dirty'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
