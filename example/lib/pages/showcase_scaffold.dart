import 'package:flutter/material.dart';
import 'package:brayan_design_system/brayan_design_system.dart';

/// Reusable scaffold for showcase pages with back navigation and title.
class ShowcaseScaffold extends StatelessWidget {
  const ShowcaseScaffold({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? BrayanColors.backgroundDark
          : BrayanColors.backgroundLight,
      appBar: AppBar(
        title: Text(
          title.toUpperCase(),
          style: BrayanTypography.headingMedium.copyWith(
            color: BrayanColors.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: BrayanColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(BrayanSpacing.sectionPadding),
        children: children,
      ),
    );
  }
}
