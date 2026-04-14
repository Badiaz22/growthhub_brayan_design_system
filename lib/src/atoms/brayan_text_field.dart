import 'package:flutter/material.dart';
import '../core/tokens/brayan_colors.dart';
import '../core/tokens/brayan_radius.dart';
import '../core/tokens/brayan_spacing.dart';
import '../core/tokens/brayan_typography.dart';

/// A text input field atom following the Brayan Design System.
///
/// Features a search-style input with icon prefix and rounded container.
class BrayanTextField extends StatelessWidget {
  const BrayanTextField({
    super.key,
    this.controller,
    this.placeholder = '',
    this.prefixIcon,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final String placeholder;
  final IconData? prefixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: BrayanSpacing.inputHeight,
      decoration: BoxDecoration(
        color: isDark ? BrayanColors.surfaceDark : BrayanColors.surfaceLight,
        borderRadius: BrayanRadius.input,
        border: Border.all(color: BrayanColors.borderMedium),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          if (prefixIcon != null)
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Icon(
                prefixIcon,
                color: BrayanColors.primary.withAlpha(153),
                size: 24,
              ),
            ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              style: BrayanTypography.input.copyWith(
                color: isDark
                    ? BrayanColors.textLight
                    : BrayanColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: BrayanTypography.inputPlaceholder.copyWith(
                  color: BrayanColors.textTertiary,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
