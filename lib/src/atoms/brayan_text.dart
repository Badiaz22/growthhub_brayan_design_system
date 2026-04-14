import 'package:flutter/material.dart';
import '../core/tokens/brayan_typography.dart';

/// A text atom with predefined Brayan Design System typography styles.
///
/// Wraps [Text] with the design system's typography tokens.
class BrayanText extends StatelessWidget {
  const BrayanText(
    this.text, {
    super.key,
    this.variant = BrayanTextVariant.bodyMedium,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.uppercase = false,
  });

  final String text;
  final BrayanTextVariant variant;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool uppercase;

  @override
  Widget build(BuildContext context) {
    final style = _resolveStyle();
    return Text(
      uppercase ? text.toUpperCase() : text,
      style: color != null ? style.copyWith(color: color) : style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }

  TextStyle _resolveStyle() {
    return switch (variant) {
      BrayanTextVariant.headingLarge => BrayanTypography.headingLarge,
      BrayanTextVariant.headingMedium => BrayanTypography.headingMedium,
      BrayanTextVariant.headingSmall => BrayanTypography.headingSmall,
      BrayanTextVariant.sectionTitle => BrayanTypography.sectionTitle,
      BrayanTextVariant.bodyLarge => BrayanTypography.bodyLarge,
      BrayanTextVariant.bodyMedium => BrayanTypography.bodyMedium,
      BrayanTextVariant.bodySmall => BrayanTypography.bodySmall,
      BrayanTextVariant.labelLarge => BrayanTypography.labelLarge,
      BrayanTextVariant.labelMedium => BrayanTypography.labelMedium,
      BrayanTextVariant.labelSmall => BrayanTypography.labelSmall,
      BrayanTextVariant.price => BrayanTypography.price,
      BrayanTextVariant.link => BrayanTypography.link,
    };
  }
}

/// Available text style variants.
enum BrayanTextVariant {
  headingLarge,
  headingMedium,
  headingSmall,
  sectionTitle,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  price,
  link,
}
