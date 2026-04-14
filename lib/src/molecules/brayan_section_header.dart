import 'package:flutter/material.dart';
import '../core/tokens/brayan_colors.dart';
import '../core/tokens/brayan_typography.dart';

/// A section header molecule with title and optional action link.
///
/// Used for "Categories", "Trending Products" sections.
class BrayanSectionHeader extends StatelessWidget {
  const BrayanSectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
    this.trailing,
    this.isUppercase = false,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Widget? trailing;
  final bool isUppercase;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Expanded(
          child: Text(
            isUppercase ? title.toUpperCase() : title,
            style: isUppercase
                ? BrayanTypography.sectionTitle.copyWith(
                    color: BrayanColors.textSecondary,
                  )
                : BrayanTypography.headingSmall.copyWith(
                    color: isDark
                        ? BrayanColors.textDarkPrimary
                        : BrayanColors.textPrimary,
                  ),
          ),
        ),
        ?trailing,
        if (actionLabel != null)
          GestureDetector(
            onTap: onAction,
            child: Text(
              actionLabel!,
              style: BrayanTypography.link.copyWith(
                color: BrayanColors.primary,
              ),
            ),
          ),
      ],
    );
  }
}
