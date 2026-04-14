import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/tokens/brayan_colors.dart';

/// Provides pre-built [ThemeData] for the Brayan Design System.
///
/// Use [BrayanTheme.light] and [BrayanTheme.dark] with [MaterialApp.theme].
abstract final class BrayanTheme {
  /// Light theme matching the Brayan Design System.
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      fontFamily: 'Public Sans',
      colorScheme: ColorScheme.light(
        primary: BrayanColors.primary,
        surface: BrayanColors.backgroundLight,
        onPrimary: BrayanColors.textOnPrimary,
        onSurface: BrayanColors.textPrimary,
      ),
      scaffoldBackgroundColor: BrayanColors.backgroundLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: BrayanColors.backgroundLight,
        foregroundColor: BrayanColors.textPrimary,
        elevation: 0,
      ),
    );
  }

  /// Dark theme matching the Brayan Design System.
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: 'Public Sans',
      colorScheme: ColorScheme.dark(
        primary: BrayanColors.primary,
        surface: BrayanColors.backgroundDark,
        onPrimary: BrayanColors.textOnPrimary,
        onSurface: BrayanColors.textDarkPrimary,
      ),
      scaffoldBackgroundColor: BrayanColors.backgroundDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: BrayanColors.backgroundDark,
        foregroundColor: BrayanColors.textDarkPrimary,
        elevation: 0,
      ),
    );
  }

  /// Light theme with Google Fonts loaded at runtime.
  static ThemeData get lightWithGoogleFonts {
    return light.copyWith(
      textTheme: GoogleFonts.publicSansTextTheme(light.textTheme),
    );
  }

  /// Dark theme with Google Fonts loaded at runtime.
  static ThemeData get darkWithGoogleFonts {
    return dark.copyWith(
      textTheme: GoogleFonts.publicSansTextTheme(dark.textTheme),
    );
  }
}
