import 'package:flutter/material.dart';
import '../core/tokens/brayan_colors.dart';

/// An image atom with hover-zoom effect for product images.
///
/// Displays a network image with proper aspect ratio and loading states.
class BrayanImage extends StatelessWidget {
  const BrayanImage({
    super.key,
    required this.imageUrl,
    this.aspectRatio = 4 / 5,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  final String imageUrl;
  final double? aspectRatio;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Widget imageContent = Container(
      color: isDark
          ? BrayanColors.cardImageBgDark
          : BrayanColors.cardImageBgLight,
      child: Image.network(
        imageUrl,
        fit: fit,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (_, _, _) => Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            color: BrayanColors.textTertiary,
            size: 32,
          ),
        ),
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              color: BrayanColors.primary,
              strokeWidth: 2,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );

    Widget image = aspectRatio != null
        ? AspectRatio(aspectRatio: aspectRatio!, child: imageContent)
        : imageContent;

    if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }

    return image;
  }
}
