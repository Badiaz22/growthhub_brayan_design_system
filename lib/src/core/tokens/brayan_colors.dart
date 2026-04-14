import 'package:flutter/material.dart';

/// Design tokens for the Brayan Design System color palette.
///
/// Extracted from the Brayan Design System reference.
abstract final class BrayanColors {
  // Brand
  static const Color primary = Color(0xFF7B6B43);
  static const Color primaryLight = Color(0x1A7B6B43); // primary/10
  static const Color primaryMedium = Color(0x337B6B43); // primary/20
  static const Color primaryOnDark = Color(0xFF7B6B43);

  // Backgrounds
  static const Color backgroundLight = Color(0xFFF7F7F6);
  static const Color backgroundDark = Color(0xFF1C1A16);
  static const Color surfaceLight = Colors.white;
  static const Color surfaceDark = Color(0xFF1E293B); // slate-800

  // Text
  static const Color textPrimary = Color(0xFF0F172A); // slate-900
  static const Color textSecondary = Color(0xFF64748B); // slate-500
  static const Color textTertiary = Color(0xFF94A3B8); // slate-400
  static const Color textLight = Color(0xFFE2E8F0); // slate-200
  static const Color textOnPrimary = Colors.white;
  static const Color textDarkPrimary = Colors.white;
  static const Color textDarkSecondary = Color(0xFFCBD5E1); // slate-300
  static const Color textDarkTertiary = Color(0xFF94A3B8); // slate-400

  // Surfaces / Cards
  static const Color cardLight = Colors.white;
  static const Color cardDark = Color(0xFF1E293B); // slate-800
  static const Color cardImageBgLight = Color(0xFFF1F5F9); // slate-100
  static const Color cardImageBgDark = Color(0xFF0F172A); // slate-900

  // Borders
  static const Color borderLight = Color(0x0D7B6B43); // primary/5
  static const Color borderMedium = Color(0x1A7B6B43); // primary/10

  // Overlays
  static const Color overlayLight = Color(0xCCFFFFFF); // white/80
  static const Color overlayDark = Color(0xCC1C1A16); // dark/80

  // Status
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
}
