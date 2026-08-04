import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom colors not covered by the default Material 3 ColorScheme.
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color statusClean;
  final Color statusDirty;
  final Color statusInspect;
  final Color textPrimary;
  final Color textMuted;
  final Color borderLight;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;

  const AppColorsExtension({
    required this.statusClean,
    required this.statusDirty,
    required this.statusInspect,
    required this.textPrimary,
    required this.textMuted,
    required this.borderLight,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  @override
  AppColorsExtension copyWith({
    Color? statusClean,
    Color? statusDirty,
    Color? statusInspect,
    Color? textPrimary,
    Color? textMuted,
    Color? borderLight,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
  }) {
    return AppColorsExtension(
      statusClean: statusClean ?? this.statusClean,
      statusDirty: statusDirty ?? this.statusDirty,
      statusInspect: statusInspect ?? this.statusInspect,
      textPrimary: textPrimary ?? this.textPrimary,
      textMuted: textMuted ?? this.textMuted,
      borderLight: borderLight ?? this.borderLight,
      surfaceContainerLowest:
          surfaceContainerLowest ?? this.surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainerHighest:
          surfaceContainerHighest ?? this.surfaceContainerHighest,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      statusClean: Color.lerp(statusClean, other.statusClean, t)!,
      statusDirty: Color.lerp(statusDirty, other.statusDirty, t)!,
      statusInspect: Color.lerp(statusInspect, other.statusInspect, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      borderLight: Color.lerp(borderLight, other.borderLight, t)!,
      surfaceContainerLowest: Color.lerp(
        surfaceContainerLowest,
        other.surfaceContainerLowest,
        t,
      )!,
      surfaceContainerLow: Color.lerp(
        surfaceContainerLow,
        other.surfaceContainerLow,
        t,
      )!,
      surfaceContainer: Color.lerp(
        surfaceContainer,
        other.surfaceContainer,
        t,
      )!,
      surfaceContainerHigh: Color.lerp(
        surfaceContainerHigh,
        other.surfaceContainerHigh,
        t,
      )!,
      surfaceContainerHighest: Color.lerp(
        surfaceContainerHighest,
        other.surfaceContainerHighest,
        t,
      )!,
    );
  }
}

class AppTheme {
  // Light Theme Colors
  static const Color _lightPrimary = Color(0xFF003F87);
  static const Color _lightPrimaryContainer = Color(0xFF0056B3);
  static const Color _lightOnPrimary = Color(0xFFFFFFFF);
  static const Color _lightSecondary = Color(0xFF006C49);
  static const Color _lightSecondaryContainer = Color(0xFF6CF8BB);
  static const Color _lightBackground = Color(0xFFF8F9FF);
  static const Color _lightSurface = Color(0xFFF8F9FF);
  static const Color _lightOnSurface = Color(0xFF0B1C30);
  static const Color _lightOnSurfaceVariant = Color(0xFF424752);
  static const Color _lightOutline = Color(0xFF727784);
  static const Color _lightOutlineVariant = Color(0xFFC2C6D4);

  static const AppColorsExtension lightColors = AppColorsExtension(
    statusClean: Color(0xFF10B981),
    statusDirty: Color(0xFFEF4444),
    statusInspect: Color(0xFFF59E0B),
    textPrimary: Color(0xFF0F172A),
    textMuted: Color(0xFF475569),
    borderLight: Color(0xFFE2E8F0),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFEFF4FF),
    surfaceContainer: Color(0xFFE5EEFF),
    surfaceContainerHigh: Color(0xFFDCE9FF),
    surfaceContainerHighest: Color(0xFFD3E4FE),
  );

  // Dark Theme Colors
  static const Color _darkPrimary = Color(0xFFACC7FF);
  static const Color _darkPrimaryContainer = Color(0xFF004491);
  static const Color _darkOnPrimary = Color(0xFF001A40);
  static const Color _darkSecondary = Color(0xFF4EDEA3);
  static const Color _darkSecondaryContainer = Color(0xFF005236);
  static const Color _darkBackground = Color(0xFF0B1C30);
  static const Color _darkSurface = Color(0xFF0B1C30);
  static const Color _darkOnSurface = Color(0xFFEAF1FF);
  static const Color _darkOnSurfaceVariant = Color(0xFFC2C6D4);
  static const Color _darkOutline = Color(0xFF8C909E);
  static const Color _darkOutlineVariant = Color(0xFF424752);

  static const AppColorsExtension darkColors = AppColorsExtension(
    statusClean: Color(0xFF10B981),
    statusDirty: Color(0xFFEF4444),
    statusInspect: Color(0xFFF59E0B),
    textPrimary: Color(0xFFF8FAFC),
    textMuted: Color(0xFF94A3B8),
    borderLight: Color(0xFF334155),
    surfaceContainerLowest: Color(0xFF0F172A),
    surfaceContainerLow: Color(0xFF1E293B),
    surfaceContainer: Color(0xFF1E293B),
    surfaceContainerHigh: Color(0xFF334155),
    surfaceContainerHighest: Color(0xFF475569),
  );

  // Spacing helper constants
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingGutter = 16.0;
  static const double spacingTouchTarget = 44.0;

  // Shapes & border radiuses
  static const double radiusSm = 4.0;
  static const double radiusDefault = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;

  static TextTheme _buildTextTheme() {
    return TextTheme(
      // display-lg
      displayLarge: GoogleFonts.hankenGrotesk(
        fontSize: 48,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.02,
        height: 56 / 48,
      ),
      // headline-lg
      headlineLarge: GoogleFonts.hankenGrotesk(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 40 / 32,
      ),
      // headline-lg-mobile (or medium)
      headlineMedium: GoogleFonts.hankenGrotesk(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 32 / 24,
      ),
      // stat-value
      titleLarge: GoogleFonts.hankenGrotesk(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 24 / 20,
      ),
      // title-md
      titleMedium: GoogleFonts.hankenGrotesk(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 24 / 18,
      ),
      // body-lg
      bodyLarge: GoogleFonts.hankenGrotesk(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
      ),
      // body-sm
      bodySmall: GoogleFonts.hankenGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
      ),
      // label-caps (JetBrains Mono)
      labelLarge: GoogleFonts.jetBrainsMono(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.05,
        height: 16 / 12,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: _lightPrimary,
        primaryContainer: _lightPrimaryContainer,
        onPrimary: _lightOnPrimary,
        secondary: _lightSecondary,
        secondaryContainer: _lightSecondaryContainer,
        surface: _lightSurface,
        onSurface: _lightOnSurface,
        onSurfaceVariant: _lightOnSurfaceVariant,
        outline: _lightOutline,
        outlineVariant: _lightOutlineVariant,
      ),
      textTheme: _buildTextTheme(),
      extensions: const <ThemeExtension<dynamic>>[lightColors],
      scaffoldBackgroundColor: _lightBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: _lightSurface,
        elevation: 0,
        iconTheme: IconThemeData(color: _lightOnSurface),
      ),
      cardTheme: CardThemeData(
        color: lightColors.surfaceContainerLowest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          side: BorderSide(color: lightColors.borderLight, width: 1),
        ),
        elevation: 0,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: _darkPrimary,
        primaryContainer: _darkPrimaryContainer,
        onPrimary: _darkOnPrimary,
        secondary: _darkSecondary,
        secondaryContainer: _darkSecondaryContainer,
        surface: _darkSurface,
        onSurface: _darkOnSurface,
        onSurfaceVariant: _darkOnSurfaceVariant,
        outline: _darkOutline,
        outlineVariant: _darkOutlineVariant,
      ),
      textTheme: _buildTextTheme(),
      extensions: const <ThemeExtension<dynamic>>[darkColors],
      scaffoldBackgroundColor: _darkBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: _darkSurface,
        elevation: 0,
        iconTheme: IconThemeData(color: _darkOnSurface),
      ),
      cardTheme: CardThemeData(
        color: darkColors.surfaceContainerLowest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          side: BorderSide(color: darkColors.borderLight, width: 1),
        ),
        elevation: 0,
      ),
    );
  }
}
