import 'package:flutter/material.dart';
import 'package:pms_admin/core/theme/app_theme.dart';

class SyncStatusWidget extends StatelessWidget {
  final bool isOnline;
  final bool isSyncing;
  final int? pendingMutationsCount;

  const SyncStatusWidget({
    super.key,
    required this.isOnline,
    required this.isSyncing,
    this.pendingMutationsCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    Color statusColor;
    String statusText;
    IconData statusIcon;

    if (isSyncing) {
      statusColor = ext.statusInspect;
      statusText = 'Syncing...';
      statusIcon = Icons.sync;
    } else if (isOnline) {
      statusColor = ext.statusClean;
      statusText = 'Online';
      statusIcon = Icons.cloud_done;
    } else {
      statusColor = ext.statusDirty;
      statusText = 'Offline';
      statusIcon = Icons.cloud_off;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusDefault),
        border: Border.all(color: ext.borderLight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSyncing)
            SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(statusColor),
              ),
            )
          else
            Icon(statusIcon, size: 16, color: statusColor),
          const SizedBox(width: 6),
          Text(
            statusText,
            style: theme.textTheme.bodySmall?.copyWith(
              color: ext.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (pendingMutationsCount != null && pendingMutationsCount! > 0) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: ext.statusInspect.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '$pendingMutationsCount pending',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: ext.statusInspect,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
