import 'package:flutter/material.dart';
import '../core/tokens/brayan_spacing.dart';
import 'brayan_product_card.dart';

/// A responsive product grid organism.
///
/// Displays a grid of [BrayanProductCard] widgets adapting to screen size.
class BrayanProductGrid extends StatelessWidget {
  const BrayanProductGrid({
    super.key,
    required this.products,
    this.onProductTap,
    this.onAddToCart,
    this.crossAxisCount,
    this.padding,
  });

  final List<BrayanProductData> products;
  final void Function(BrayanProductData product)? onProductTap;
  final void Function(BrayanProductData product)? onAddToCart;
  final int? crossAxisCount;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns =
            crossAxisCount ?? _responsiveColumns(constraints.maxWidth);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: padding ?? EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: BrayanSpacing.gridGap,
            mainAxisSpacing: BrayanSpacing.gridGap,
            childAspectRatio: 0.72,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return BrayanProductCard(
              product: product,
              onTap: onProductTap != null ? () => onProductTap!(product) : null,
              onAddToCart: onAddToCart != null
                  ? () => onAddToCart!(product)
                  : null,
            );
          },
        );
      },
    );
  }

  int _responsiveColumns(double width) {
    if (width >= 1024) return 4;
    if (width >= 768) return 3;
    return 2;
  }
}
