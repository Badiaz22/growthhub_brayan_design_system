import 'package:flutter/material.dart';
import '../core/tokens/brayan_colors.dart';
import '../core/tokens/brayan_spacing.dart';
import '../core/tokens/brayan_typography.dart';

/// A badge atom for showing counts (e.g. cart item count).
///
/// Small circular badge with number, positioned absolutely on parent.
class BrayanBadge extends StatelessWidget {
  const BrayanBadge({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();

    return Container(
      width: BrayanSpacing.badgeSize,
      height: BrayanSpacing.badgeSize,
      decoration: const BoxDecoration(
        color: BrayanColors.primary,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        count > 99 ? '99+' : count.toString(),
        style: BrayanTypography.labelSmall.copyWith(
          color: BrayanColors.textOnPrimary,
          fontSize: 8,
        ),
      ),
    );
  }
}
