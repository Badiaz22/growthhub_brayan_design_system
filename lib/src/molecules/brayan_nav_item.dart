import 'package:flutter/material.dart';
import '../core/tokens/brayan_colors.dart';
import '../core/tokens/brayan_typography.dart';
import '../atoms/brayan_badge.dart';

/// A bottom navigation item molecule.
///
/// Combines an icon, label, and optional badge for navigation bar items.
class BrayanNavItem extends StatelessWidget {
  const BrayanNavItem({
    super.key,
    required this.icon,
    required this.label,
    this.isActive = false,
    this.badgeCount = 0,
    this.onTap,
    this.filledWhenActive = false,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final int badgeCount;
  final VoidCallback? onTap;
  final bool filledWhenActive;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final activeColor = BrayanColors.primary;
    final inactiveColor = isDark
        ? BrayanColors.textDarkTertiary
        : BrayanColors.textSecondary;
    final color = isActive ? activeColor : inactiveColor;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(icon, size: 24, color: color),
                if (badgeCount > 0)
                  Positioned(
                    top: -4,
                    right: -4,
                    child: BrayanBadge(count: badgeCount),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label.toUpperCase(),
              style: BrayanTypography.labelMedium.copyWith(
                color: color,
                fontSize: 10,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
