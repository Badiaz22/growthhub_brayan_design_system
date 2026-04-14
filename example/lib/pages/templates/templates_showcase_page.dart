import 'package:flutter/material.dart';
import 'package:brayan_design_system/brayan_design_system.dart';
import 'widgets/template_zone.dart';

/// Showcase page for Templates — page-level layout structures.
class TemplatesShowcasePage extends StatelessWidget {
  const TemplatesShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BrayanStoreTemplate(
      title: 'Template Demo',
      showSearch: true,
      bottomNav: BrayanBottomNav(
        items: const [
          BrayanNavItemData(icon: Icons.home, label: 'Home'),
          BrayanNavItemData(icon: Icons.grid_view, label: 'Categories'),
          BrayanNavItemData(
            icon: Icons.shopping_bag,
            label: 'Cart',
            badgeCount: 2,
          ),
          BrayanNavItemData(icon: Icons.person, label: 'Profile'),
        ],
        currentIndex: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(BrayanSpacing.sectionPadding),
        children: [
          const BrayanSectionHeader(
            title: 'TEMPLATE STRUCTURE',
            isUppercase: true,
          ),
          const SizedBox(height: 16),
          TemplateZone(
            label: 'Header Zone',
            description: 'Contains: title, menu/profile icons, search bar',
            color: BrayanColors.primary.withAlpha(26),
          ),
          const SizedBox(height: 12),
          TemplateZone(
            label: 'Content Zone (this area)',
            description: 'Scrollable body — receives any widget tree',
            color: BrayanColors.primary.withAlpha(51),
            height: 200,
          ),
          const SizedBox(height: 12),
          TemplateZone(
            label: 'Bottom Nav Zone',
            description: 'Fixed navigation bar with badge support',
            color: BrayanColors.primary.withAlpha(26),
          ),
          const SizedBox(height: 24),
          Center(
            child: BrayanButton(
              label: 'Back',
              variant: BrayanButtonVariant.secondary,
              icon: Icons.arrow_back,
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
