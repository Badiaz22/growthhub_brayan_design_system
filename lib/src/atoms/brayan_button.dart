import 'package:flutter/material.dart';
import '../core/tokens/brayan_colors.dart';
import '../core/tokens/brayan_radius.dart';
import '../core/tokens/brayan_spacing.dart';
import '../core/tokens/brayan_typography.dart';

/// Button variants for the Brayan Design System.
enum BrayanButtonVariant { primary, secondary, ghost }

/// A button atom following the Brayan Design System.
///
/// Supports primary (filled), secondary (outlined) and ghost variants.
class BrayanButton extends StatelessWidget {
  const BrayanButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = BrayanButtonVariant.primary,
    this.icon,
    this.isFullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final BrayanButtonVariant variant;
  final IconData? icon;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: BrayanSpacing.chipHeight,
      child: Material(
        color: _backgroundColor,
        borderRadius: BrayanRadius.button,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BrayanRadius.button,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BrayanRadius.button,
              border: variant == BrayanButtonVariant.secondary
                  ? Border.all(color: BrayanColors.borderMedium)
                  : null,
            ),
            child: Row(
              mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 20, color: _textColor),
                  const SizedBox(width: 8),
                ],
                Text(
                  label.toUpperCase(),
                  style: BrayanTypography.labelLarge.copyWith(
                    color: _textColor,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color get _backgroundColor {
    return switch (variant) {
      BrayanButtonVariant.primary => BrayanColors.primary,
      BrayanButtonVariant.secondary => Colors.transparent,
      BrayanButtonVariant.ghost => Colors.transparent,
    };
  }

  Color get _textColor {
    return switch (variant) {
      BrayanButtonVariant.primary => BrayanColors.textOnPrimary,
      BrayanButtonVariant.secondary => BrayanColors.primary,
      BrayanButtonVariant.ghost => BrayanColors.primary,
    };
  }
}
