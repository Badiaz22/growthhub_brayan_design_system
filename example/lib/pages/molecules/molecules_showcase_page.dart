import 'package:flutter/material.dart';
import 'package:brayan_design_system/brayan_design_system.dart';
import '../showcase_scaffold.dart';
import 'widgets/section_title.dart';

/// Showcase page for Molecules — combinations of atoms.
class MoleculesShowcasePage extends StatefulWidget {
  const MoleculesShowcasePage({super.key});

  @override
  State<MoleculesShowcasePage> createState() => _MoleculesShowcasePageState();
}

class _MoleculesShowcasePageState extends State<MoleculesShowcasePage> {
  int _selectedChip = 0;

  static const _categories = [
    'All',
    'Electronics',
    'Jewelry',
    "Men's",
    "Women's",
  ];

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Molecules',
      children: [
        // ── BrayanSearchBar ──
        SectionTitle('BrayanSearchBar'),
        const SizedBox(height: 12),
        const BrayanSearchBar(placeholder: 'Search curated collections...'),
        const Divider(height: 32),

        // ── BrayanCategoryChip ──
        SectionTitle('BrayanCategoryChip'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (var i = 0; i < _categories.length; i++)
              BrayanCategoryChip(
                label: _categories[i],
                isSelected: i == _selectedChip,
                onTap: () => setState(() => _selectedChip = i),
              ),
          ],
        ),
        const Divider(height: 32),

        // ── BrayanNavItem ──
        SectionTitle('BrayanNavItem'),
        const SizedBox(height: 12),
        Container(
          height: 64,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? BrayanColors.cardDark
                : BrayanColors.cardLight,
            borderRadius: BrayanRadius.card,
            border: Border.all(color: BrayanColors.borderMedium),
          ),
          child: const Row(
            children: [
              BrayanNavItem(icon: Icons.home, label: 'Home', isActive: true),
              BrayanNavItem(icon: Icons.grid_view, label: 'Categories'),
              BrayanNavItem(
                icon: Icons.shopping_bag,
                label: 'Cart',
                badgeCount: 3,
              ),
              BrayanNavItem(icon: Icons.person, label: 'Profile'),
            ],
          ),
        ),
        const Divider(height: 32),

        // ── BrayanSectionHeader ──
        SectionTitle('BrayanSectionHeader'),
        const SizedBox(height: 12),
        const BrayanSectionHeader(
          title: 'CATEGORIES',
          actionLabel: 'View All',
          isUppercase: true,
        ),
        const SizedBox(height: 16),
        const BrayanSectionHeader(
          title: 'Trending Products',
          trailing: BrayanText(
            '24 items found',
            variant: BrayanTextVariant.bodySmall,
            color: BrayanColors.textTertiary,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
