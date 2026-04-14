import 'package:flutter/material.dart';
import 'package:brayan_design_system/brayan_design_system.dart';
import '../../sample_data.dart';

/// Full page showcase — a complete Brayan Store e-commerce page with real data.
class FullPageShowcase extends StatefulWidget {
  const FullPageShowcase({super.key});

  @override
  State<FullPageShowcase> createState() => _FullPageShowcaseState();
}

class _FullPageShowcaseState extends State<FullPageShowcase> {
  int _selectedCategory = 0;
  int _selectedNav = 0;

  static const _categories = [
    'All',
    'Electronics',
    'Jewelry',
    "Men's",
    "Women's",
  ];

  @override
  Widget build(BuildContext context) {
    return BrayanStoreTemplate(
      title: 'Brayan Store',
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
        currentIndex: _selectedNav,
        onTap: (i) => setState(() => _selectedNav = i),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: BrayanSectionHeader(
                title: 'CATEGORIES',
                actionLabel: 'View All',
                isUppercase: true,
                onAction: () {},
              ),
            ),
            BrayanCategoryFilter(
              categories: _categories,
              selectedIndex: _selectedCategory,
              onSelected: (i) => setState(() => _selectedCategory = i),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BrayanSectionHeader(
                title: 'Trending Products',
                trailing: BrayanText(
                  '${sampleProducts.length} items found',
                  variant: BrayanTextVariant.bodySmall,
                  color: BrayanColors.textTertiary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            BrayanProductGrid(
              products: sampleProducts,
              onAddToCart: (product) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added ${product.title} to cart'),
                    backgroundColor: BrayanColors.primary,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BrayanRadius.button,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
