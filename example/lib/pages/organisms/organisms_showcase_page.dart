import 'package:flutter/material.dart';
import 'package:brayan_design_system/brayan_design_system.dart';
import '../showcase_scaffold.dart';
import '../../sample_data.dart';
import 'widgets/section_title.dart';

/// Showcase page for Organisms — complex, distinct sections of an interface.
class OrganismsShowcasePage extends StatefulWidget {
  const OrganismsShowcasePage({super.key});

  @override
  State<OrganismsShowcasePage> createState() => _OrganismsShowcasePageState();
}

class _OrganismsShowcasePageState extends State<OrganismsShowcasePage> {
  int _selectedCategory = 0;
  int _selectedNav = 0;

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Organisms',
      children: [
        // ── BrayanAppHeader ──
        SectionTitle('BrayanAppHeader'),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BrayanRadius.card,
          child: const BrayanAppHeader(title: 'Brayan Store'),
        ),
        const Divider(height: 32),

        // ── BrayanCategoryFilter ──
        SectionTitle('BrayanCategoryFilter'),
        const SizedBox(height: 12),
        BrayanCategoryFilter(
          categories: const [
            'All',
            'Electronics',
            'Jewelry',
            "Men's",
            "Women's",
          ],
          selectedIndex: _selectedCategory,
          onSelected: (i) => setState(() => _selectedCategory = i),
        ),
        const Divider(height: 32),

        // ── BrayanProductCard ──
        SectionTitle('BrayanProductCard'),
        const SizedBox(height: 12),
        SizedBox(
          width: 200,
          child: BrayanProductCard(
            product: sampleProducts.first,
            onAddToCart: () {},
          ),
        ),
        const Divider(height: 32),

        // ── BrayanProductGrid ──
        SectionTitle('BrayanProductGrid'),
        const SizedBox(height: 12),
        BrayanProductGrid(
          products: sampleProducts.take(4).toList(),
          onAddToCart: (_) {},
        ),
        const Divider(height: 32),

        // ── BrayanBottomNav ──
        SectionTitle('BrayanBottomNav'),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BrayanRadius.card,
          child: BrayanBottomNav(
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
            currentIndex: _selectedNav,
            onTap: (i) => setState(() => _selectedNav = i),
          ),
        ),
      ],
    );
  }
}
