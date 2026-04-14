import 'package:flutter/material.dart';
import 'package:brayan_design_system/brayan_design_system.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: BrayanText(
        title,
        variant: BrayanTextVariant.sectionTitle,
        uppercase: true,
        color: BrayanColors.textSecondary,
      ),
    );
  }
}
