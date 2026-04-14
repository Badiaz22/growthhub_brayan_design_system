import 'package:flutter/material.dart';
import '../core/tokens/brayan_colors.dart';
import '../core/tokens/brayan_radius.dart';
import '../core/tokens/brayan_shadows.dart';
import '../core/tokens/brayan_spacing.dart';
import '../core/tokens/brayan_typography.dart';
import '../atoms/brayan_icon_button.dart';
import '../atoms/brayan_image.dart';

/// Data model for a product card.
class BrayanProductData {
  const BrayanProductData({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.id,
  });

  final String? id;
  final String title;
  final double price;
  final String imageUrl;
  final String category;
}

/// A product card organism displaying image, category, title, price and action.
///
/// Reproduces the product card from the Brayan Design System grid.
class BrayanProductCard extends StatefulWidget {
  const BrayanProductCard({
    super.key,
    required this.product,
    this.onAddToCart,
    this.onTap,
  });

  final BrayanProductData product;
  final VoidCallback? onAddToCart;
  final VoidCallback? onTap;

  @override
  State<BrayanProductCard> createState() => _BrayanProductCardState();
}

class _BrayanProductCardState extends State<BrayanProductCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isDark ? BrayanColors.cardDark : BrayanColors.cardLight,
            borderRadius: BrayanRadius.card,
            border: Border.all(color: BrayanColors.borderLight),
            boxShadow: [
              _isHovered ? BrayanShadows.cardMd : BrayanShadows.cardSm,
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: BrayanImage(
                  imageUrl: widget.product.imageUrl,
                  aspectRatio: 4 / 3,
                  fit: BoxFit.contain,
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(BrayanSpacing.cardPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category
                    Text(
                      widget.product.category.toUpperCase(),
                      style: BrayanTypography.labelMedium.copyWith(
                        color: BrayanColors.primary,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 2),
                    // Title
                    Text(
                      widget.product.title,
                      style: BrayanTypography.bodyMedium.copyWith(
                        color: isDark
                            ? BrayanColors.textLight
                            : BrayanColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    // Price and action
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.product.price.toStringAsFixed(2)}',
                          style: BrayanTypography.price.copyWith(
                            color: isDark
                                ? BrayanColors.textDarkPrimary
                                : BrayanColors.textPrimary,
                          ),
                        ),
                        SizedBox(
                          width: BrayanSpacing.smallIconButtonSize,
                          height: BrayanSpacing.smallIconButtonSize,
                          child: BrayanIconButton(
                            icon: Icons.add_shopping_cart,
                            onPressed: widget.onAddToCart,
                            size: BrayanSpacing.smallIconButtonSize,
                            iconSize: 20,
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
