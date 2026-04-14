import 'package:flutter/material.dart';
import '../core/tokens/brayan_colors.dart';
import '../core/tokens/brayan_radius.dart';
import '../core/tokens/brayan_shadows.dart';
import '../core/tokens/brayan_spacing.dart';
import '../core/tokens/brayan_typography.dart';

/// A category filter chip molecule.
///
/// Displays a selectable category pill with active/inactive state.
class BrayanCategoryChip extends StatelessWidget {
  const BrayanCategoryChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: BrayanSpacing.chipHeight,
        padding: const EdgeInsets.symmetric(
          horizontal: BrayanSpacing.chipPaddingH,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? BrayanColors.primary
              : (isDark ? BrayanColors.surfaceDark : BrayanColors.surfaceLight),
          borderRadius: BrayanRadius.chip,
          border: isSelected
              ? null
              : Border.all(color: BrayanColors.borderMedium),
          boxShadow: isSelected ? BrayanShadows.primaryGlow : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label.toUpperCase(),
          style: BrayanTypography.labelMedium.copyWith(
            color: isSelected
                ? BrayanColors.textOnPrimary
                : (isDark
                      ? BrayanColors.textDarkSecondary
                      : BrayanColors.textSecondary),
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
