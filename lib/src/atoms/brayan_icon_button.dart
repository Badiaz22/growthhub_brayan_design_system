import 'package:flutter/material.dart';
import '../core/tokens/brayan_colors.dart';
import '../core/tokens/brayan_spacing.dart';

/// An icon button atom following the Brayan Design System.
///
/// Used for header actions (menu, profile) and card actions (add to cart).
class BrayanIconButton extends StatelessWidget {
  const BrayanIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = BrayanSpacing.iconButtonSize,
    this.iconSize = 24.0,
    this.filled = false,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final double iconSize;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: filled ? BrayanColors.primaryLight : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          hoverColor: filled
              ? BrayanColors.primary
              : BrayanColors.primary.withAlpha(13),
          child: Center(
            child: Icon(
              icon,
              size: iconSize,
              color: filled
                  ? BrayanColors.primary
                  : (isDark
                        ? BrayanColors.textDarkSecondary
                        : BrayanColors.textSecondary),
            ),
          ),
        ),
      ),
    );
  }
}
