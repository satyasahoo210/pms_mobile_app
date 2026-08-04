import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/core/theme/app_theme.dart';
import 'package:pms_admin/core/utils/logger.dart';
import 'package:pms_admin/core/widgets/empty_state_widget.dart';
import 'package:pms_admin/features/auth/presentation/auth_controller.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_controller.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;
    final propertiesAsync = ref.watch(propertiesProvider);
    final selectedProperty = ref.watch(selectedPropertyProvider);

    // Auto-select first property if none selected
    propertiesAsync.whenData((properties) {
      if (selectedProperty == null && properties.isNotEmpty) {
        Future.microtask(() {
          ref.read(selectedPropertyProvider.notifier).state = properties.first;
        });
      }
    });

    // Return to login screen when exception received
    ref.listen<AsyncValue>(propertiesProvider, (previous, next) {
      if (next.hasError) {
        appLog(
          '[DashboardScreen] Exception received while loading properties ${next.error}',
        );
        ref.read(authControllerProvider.notifier).logout();
      }
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              ),
              child: const Icon(Icons.hotel, size: 18, color: Colors.white),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {
              // Notification action
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authControllerProvider.notifier).logout();
            },
            tooltip: 'Logout',
          ),
          const SizedBox(width: AppTheme.spacingSm),
        ],
      ),
      body: selectedProperty == null
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(dashboardStatsProvider);
                ref.invalidate(upcomingArrivalsProvider);
                ref.invalidate(recentActivityProvider);
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(AppTheme.spacingGutter),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isTablet = constraints.maxWidth > 700;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Console Header
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MANAGEMENT CONSOLE',
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.colorScheme.primary,
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(height: AppTheme.spacingXs),
                            Text(
                              'Dashboard Overview',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: ext.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppTheme.spacingLg),

                        // Stats Bento Grid
                        _buildStatsGrid(context, ref, isTablet),
                        const SizedBox(height: AppTheme.spacingLg),

                        // Responsive Content Split (Tablet vs Mobile Layouts)
                        if (isTablet)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    _buildQuickActions(context),
                                    const SizedBox(height: AppTheme.spacingLg),
                                    _buildArrivalsList(context, ref),
                                  ],
                                ),
                              ),
                              const SizedBox(width: AppTheme.spacingLg),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    _buildRecentActivity(context, ref),
                                    const SizedBox(height: AppTheme.spacingLg),
                                    _buildRoomInventory(context, ref),
                                  ],
                                ),
                              ),
                            ],
                          )
                        else
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _buildQuickActions(context),
                              const SizedBox(height: AppTheme.spacingLg),
                              _buildArrivalsList(context, ref),
                              const SizedBox(height: AppTheme.spacingLg),
                              _buildRecentActivity(context, ref),
                              const SizedBox(height: AppTheme.spacingLg),
                              _buildRoomInventory(context, ref),
                              const SizedBox(height: AppTheme.spacingXl),
                            ],
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
    );
  }

  Widget _buildStatsGrid(BuildContext context, WidgetRef ref, bool isTablet) {
    final statsAsync = ref.watch(dashboardStatsProvider);
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    return statsAsync.when(
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (err, _) => Center(child: Text('Error loading stats: $err')),
      data: (stats) {
        final double revenue = stats.revenueSummary;
        final revenueFormatted = NumberFormat.currency(
          locale: 'en_IN',
          symbol: '₹',
          decimalDigits: 0,
        ).format(revenue);

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: isTablet ? 4 : 2,
          crossAxisSpacing: AppTheme.spacingMd,
          mainAxisSpacing: AppTheme.spacingMd,
          childAspectRatio: isTablet ? 1.4 : 1.3,
          children: [
            // Occupancy
            _buildStatCard(
              context,
              icon: Icons.bed_outlined,
              iconBg: ext.surfaceContainer,
              iconColor: theme.colorScheme.primary,
              label: 'OCCUPANCY',
              value: '${stats.occupancyPercentage.toStringAsFixed(0)}% Today',
              badgeText: 'STABLE',
              badgeColor: ext.statusClean,
            ),
            // Total Revenue
            _buildStatCard(
              context,
              icon: Icons.payments_outlined,
              iconBg: ext.surfaceContainerHigh,
              iconColor: theme.colorScheme.secondary,
              label: 'TOTAL REVENUE',
              value: revenueFormatted,
              badgeText: '+12.4%',
              badgeColor: theme.colorScheme.primary,
            ),
            // Pending Arrivals
            _buildStatCard(
              context,
              icon: Icons.login_outlined,
              iconBg: ext.surfaceContainerLow,
              iconColor: ext.statusInspect,
              label: 'PENDING ARRIVALS',
              value: '${stats.arrivalsToday} Arrivals',
              badgeText: 'TODAY',
              badgeColor: ext.statusInspect,
            ),
            // Staff
            _buildStatCard(
              context,
              icon: Icons.groups_outlined,
              iconBg: ext.surfaceContainerHighest,
              iconColor: ext.textPrimary,
              label: 'STAFF ACTIVE',
              value: '${stats.staffCount} Active',
              badgeText: 'ON DUTY',
              badgeColor: ext.textMuted,
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String label,
    required String value,
    required String badgeText,
    required Color badgeColor,
  }) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                  ),
                  child: Icon(icon, color: iconColor, size: 20),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                  ),
                  child: Text(
                    badgeText,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: badgeColor,
                      fontSize: 8,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: ext.textMuted,
                    fontSize: 9,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: ext.textPrimary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: theme.textTheme.titleMedium?.copyWith(
                color: ext.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppTheme.spacingMd),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: AppTheme.spacingSm,
              mainAxisSpacing: AppTheme.spacingSm,
              childAspectRatio: 1.1,
              children: [
                _buildActionTile(
                  context,
                  Icons.add_circle_outline,
                  'New Booking',
                  onTap: () => context.push('/bookings'),
                ),
                _buildActionTile(
                  context,
                  Icons.how_to_reg_outlined,
                  'Check-In',
                  onTap: () => context.go('/calendar?scrollToToday=true'),
                ),
                _buildActionTile(
                  context,
                  Icons.receipt_long,
                  'Bookings',
                  onTap: () => context.go('/bookings/list'),
                ),
                _buildActionTile(
                  context,
                  Icons.cleaning_services_outlined,
                  'Cleaning',
                  onTap: () => context.go('/housekeeping'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(
    BuildContext context,
    IconData icon,
    String label, {
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.radiusDefault),
      child: Container(
        decoration: BoxDecoration(
          color: ext.surfaceContainerLow,
          borderRadius: BorderRadius.circular(AppTheme.radiusDefault),
          border: Border.all(color: ext.borderLight),
        ),
        padding: const EdgeInsets.all(AppTheme.spacingXs),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: theme.colorScheme.primary, size: 24),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge?.copyWith(
                color: ext.textPrimary,
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArrivalsList(BuildContext context, WidgetRef ref) {
    final arrivalsAsync = ref.watch(upcomingArrivalsProvider);
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingMd),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming Arrivals',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: ext.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () => context.go('/bookings/list?tab=CONFIRMED'),
                  child: Text(
                    'VIEW ALL',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          arrivalsAsync.when(
            loading: () => const Padding(
              padding: EdgeInsets.all(32.0),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (err, _) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Error: $err'),
            ),
            data: (arrivals) {
              if (arrivals.isEmpty) {
                return const EmptyStateWidget(
                  title: 'No arrivals today',
                  description:
                      'All bookings are processed or none expected today.',
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: arrivals.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = arrivals[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: ext.surfaceContainerLow,
                      child: Icon(
                        Icons.person,
                        color: theme.colorScheme.primary,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      item.guestName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: ext.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Room ${item.roomNumber}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: ext.textMuted,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'ETA',
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: ext.textMuted,
                                fontSize: 8,
                              ),
                            ),
                            Text(
                              item.eta,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: ext.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: item.isPrepaid
                                ? theme.colorScheme.primaryContainer.withValues(
                                    alpha: 0.2,
                                  )
                                : ext.statusDirty.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(
                              AppTheme.radiusSm,
                            ),
                          ),
                          child: Text(
                            item.isPrepaid ? 'PRE-PAID' : 'PAY AT DESK',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: item.isPrepaid
                                  ? theme.colorScheme.primary
                                  : ext.statusDirty,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context, WidgetRef ref) {
    final activityAsync = ref.watch(recentActivityProvider);
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.history, color: theme.colorScheme.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Recent Activity',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: ext.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingMd),
            activityAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Text('Error: $err'),
              data: (activities) {
                if (activities.isEmpty) {
                  return const Text('No recent activities');
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    final item = activities[index];
                    IconData icon;
                    Color color;

                    switch (item.type) {
                      case 'clean':
                        icon = Icons.check_circle_outline;
                        color = ext.statusClean;
                        break;
                      case 'checkin':
                        icon = Icons.vpn_key_outlined;
                        color = theme.colorScheme.primary;
                        break;
                      case 'maintenance':
                        icon = Icons.error_outline;
                        color = ext.statusDirty;
                        break;
                      case 'payment':
                        icon = Icons.payments_outlined;
                        color = theme.colorScheme.secondary;
                        break;
                      default:
                        icon = Icons.info_outline;
                        color = ext.textMuted;
                    }

                    return IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: color.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(icon, color: color, size: 14),
                              ),
                              if (index < activities.length - 1)
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    color: ext.borderLight,
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: ext.textPrimary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '${item.timeAgo} • ${item.staffName}',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: ext.textMuted,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomInventory(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(dashboardStatsProvider);
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Room Inventory',
              style: theme.textTheme.titleMedium?.copyWith(
                color: ext.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppTheme.spacingMd),
            statsAsync.when(
              loading: () => const SizedBox(),
              error: (_, __) => const SizedBox(),
              data: (stats) {
                final total = stats.totalRooms;
                final ready = stats.availableRooms;
                final dirty = stats.dirtyRooms;
                final maint = stats.maintenanceRooms;

                final readyPercent = total > 0 ? (ready / total) : 0.75;
                final dirtyPercent = total > 0 ? (dirty / total) : 0.15;
                final maintPercent = total > 0 ? (maint / total) : 0.05;

                return Column(
                  children: [
                    _buildInventoryRow(
                      context,
                      'Ready',
                      ready,
                      readyPercent,
                      ext.statusClean,
                    ),
                    const SizedBox(height: 12),
                    _buildInventoryRow(
                      context,
                      'Dirty',
                      dirty,
                      dirtyPercent,
                      ext.statusDirty,
                    ),
                    const SizedBox(height: 12),
                    _buildInventoryRow(
                      context,
                      'Maintenance',
                      maint,
                      maintPercent,
                      ext.statusInspect,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: AppTheme.spacingLg),
            OutlinedButton(
              onPressed: () => context.push('/inventory'),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: theme.colorScheme.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radiusDefault),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                'FULL INVENTORY GRID',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInventoryRow(
    BuildContext context,
    String label,
    int count,
    double percent,
    Color progressColor,
  ) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: progressColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: ext.textPrimary,
                  ),
                ),
              ],
            ),
            Text(
              '$count',
              style: theme.textTheme.bodySmall?.copyWith(
                color: ext.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: percent,
            backgroundColor: ext.surfaceContainerLow,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            minHeight: 6,
          ),
        ),
      ],
    );
  }
}
