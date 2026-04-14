import 'package:flutter/material.dart';
import 'brayan_colors.dart';

/// Shadow tokens for the Brayan Design System.
abstract final class BrayanShadows {
  static const BoxShadow cardSm = BoxShadow(
    color: Color(0x0D000000),
    blurRadius: 4,
    offset: Offset(0, 1),
  );

  static const BoxShadow cardMd = BoxShadow(
    color: Color(0x1A000000),
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  static List<BoxShadow> get primaryGlow => [
    BoxShadow(
      color: BrayanColors.primary.withAlpha(51), // 20%
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];
}
