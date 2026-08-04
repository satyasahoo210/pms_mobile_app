import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pms_admin/core/theme/app_theme.dart';
import 'package:pms_admin/features/auth/presentation/auth_controller.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_controller.dart';

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;
    final selectedProperty = ref.watch(selectedPropertyProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MORE & SETTINGS',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
            if (selectedProperty != null)
              Text(
                selectedProperty.name.toUpperCase(),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: ext.textMuted,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        children: [
          // Section Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Text(
              'MANAGEMENT TOOLS',
              style: theme.textTheme.labelMedium?.copyWith(
                color: ext.textMuted,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Cards/Tiles list
          _buildMenuCard(
            context: context,
            title: 'Bookings List',
            subtitle: 'View, search, and manage all property bookings',
            icon: Icons.book_online,
            color: Colors.blue,
            onTap: () => context.push('/bookings/list'),
            ext: ext,
          ),
          const SizedBox(height: AppTheme.spacingMd),
          _buildMenuCard(
            context: context,
            title: 'Availability Grid',
            subtitle: 'Check real-time inventory and room availability',
            icon: Icons.grid_view,
            color: Colors.teal,
            onTap: () => context.push('/inventory'),
            ext: ext,
          ),
          const SizedBox(height: AppTheme.spacingMd),
          _buildMenuCard(
            context: context,
            title: 'Housekeeping status',
            subtitle: 'Update room clean states and cleaning priority',
            icon: Icons.cleaning_services,
            color: Colors.amber,
            onTap: () => context.push('/housekeeping'),
            ext: ext,
          ),

          const SizedBox(height: AppTheme.spacingXl),

          // Account Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Text(
              'ACCOUNT & SESSION',
              style: theme.textTheme.labelMedium?.copyWith(
                color: ext.textMuted,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
              ),
            ),
          ),
          const SizedBox(height: 8),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusLg),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingMd,
                vertical: AppTheme.spacingSm,
              ),
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.logout, color: Colors.red),
              ),
              title: Text(
                'Sign Out',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              subtitle: Text(
                'End your current admin session securely',
                style: theme.textTheme.bodySmall?.copyWith(color: ext.textMuted),
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.red),
              onTap: () => _showSignOutDialog(context, ref),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required AppColorsExtension ext,
  }) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingMd,
          vertical: AppTheme.spacingSm,
        ),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: ext.textPrimary,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(color: ext.textMuted),
        ),
        trailing: Icon(Icons.chevron_right, color: ext.textMuted),
        onTap: onTap,
      ),
    );
  }

  void _showSignOutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out of TravelsPuri13 Admin?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(authControllerProvider.notifier).logout();
              },
              child: const Text('Sign Out', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
