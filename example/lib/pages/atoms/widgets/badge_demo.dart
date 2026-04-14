import 'package:flutter/material.dart';
import 'package:brayan_design_system/brayan_design_system.dart';

class BadgeDemo extends StatelessWidget {
  const BadgeDemo({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(
          Icons.shopping_bag_outlined,
          size: 28,
          color: BrayanColors.textSecondary,
        ),
        Positioned(top: -4, right: -4, child: BrayanBadge(count: count)),
      ],
    );
  }
}
