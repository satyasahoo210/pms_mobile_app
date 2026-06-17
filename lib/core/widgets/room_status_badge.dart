import 'package:flutter/material.dart';
import 'package:pms_admin/core/theme/app_theme.dart';

class RoomStatusBadge extends StatelessWidget {
  final String status;
  final bool isCaps;

  const RoomStatusBadge({super.key, required this.status, this.isCaps = true});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    Color bgColor;
    Color textColor;
    String displayLabel = isCaps ? status.toUpperCase() : status;

    switch (status.toLowerCase()) {
      case 'available':
      case 'clean':
      case 'ready':
        bgColor = ext.statusClean.withValues(alpha: 0.15);
        textColor = ext.statusClean;
        displayLabel = 'READY';
        break;
      case 'dirty':
        bgColor = ext.statusDirty.withValues(alpha: 0.15);
        textColor = ext.statusDirty;
        displayLabel = 'DIRTY';
        break;
      case 'maintenance':
        bgColor = ext.statusInspect.withValues(alpha: 0.15);
        textColor = ext.statusInspect;
        displayLabel = 'MAINTENANCE';
        break;
      case 'inspecting':
      case 'inspect':
        bgColor = ext.statusInspect.withValues(alpha: 0.15);
        textColor = ext.statusInspect;
        displayLabel = 'INSPECT';
        break;
      case 'occupied':
        bgColor = theme.colorScheme.primary.withValues(alpha: 0.15);
        textColor = theme.colorScheme.primary;
        displayLabel = 'OCCUPIED';
        break;
      case 'cleaning':
        bgColor = theme.colorScheme.secondary.withValues(alpha: 0.15);
        textColor = theme.colorScheme.secondary;
        displayLabel = 'CLEANING';
        break;
      default:
        bgColor = theme.colorScheme.outline.withValues(alpha: 0.15);
        textColor = theme.colorScheme.outline;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusXl),
      ),
      child: Text(
        displayLabel,
        style: theme.textTheme.labelLarge?.copyWith(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
