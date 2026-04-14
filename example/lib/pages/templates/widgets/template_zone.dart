import 'package:flutter/material.dart';
import 'package:brayan_design_system/brayan_design_system.dart';

class TemplateZone extends StatelessWidget {
  const TemplateZone({
    super.key,
    required this.label,
    required this.description,
    required this.color,
    this.height = 80,
  });

  final String label;
  final String description;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BrayanRadius.card,
        border: Border.all(
          color: BrayanColors.primary.withAlpha(77),
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BrayanText(
            label,
            variant: BrayanTextVariant.labelLarge,
            color: BrayanColors.primary,
          ),
          const SizedBox(height: 4),
          BrayanText(
            description,
            variant: BrayanTextVariant.bodySmall,
            color: BrayanColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
