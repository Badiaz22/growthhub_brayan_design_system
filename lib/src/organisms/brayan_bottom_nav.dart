import 'package:flutter/material.dart';
import '../core/tokens/brayan_colors.dart';
import '../core/tokens/brayan_spacing.dart';
import '../molecules/brayan_nav_item.dart';

/// Data for a bottom navigation tab item.
class BrayanNavItemData {
  const BrayanNavItemData({
    required this.icon,
    required this.label,
    this.badgeCount = 0,
  });

  final IconData icon;
  final String label;
  final int badgeCount;
}

/// The bottom navigation bar organism.
///
/// Fixed at the bottom, translucent background with blur effect.
class BrayanBottomNav extends StatelessWidget {
  const BrayanBottomNav({
    super.key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
  });

  final List<BrayanNavItemData> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? BrayanColors.backgroundDark.withAlpha(242)
            : Colors.white.withAlpha(242),
        border: const Border(top: BorderSide(color: BrayanColors.borderMedium)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: BrayanSpacing.bottomNavHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: List.generate(items.length, (index) {
                final item = items[index];
                return BrayanNavItem(
                  icon: item.icon,
                  label: item.label,
                  isActive: index == currentIndex,
                  badgeCount: item.badgeCount,
                  onTap: onTap != null ? () => onTap!(index) : null,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
