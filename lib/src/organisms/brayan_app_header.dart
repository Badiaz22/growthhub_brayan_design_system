import 'package:flutter/material.dart';
import '../core/tokens/brayan_colors.dart';
import '../core/tokens/brayan_spacing.dart';
import '../core/tokens/brayan_typography.dart';
import '../atoms/brayan_icon_button.dart';
import '../molecules/brayan_search_bar.dart';

/// The app header organism with menu, title, profile icon and search bar.
///
/// Matches the sticky header from the Brayan Design System.
class BrayanAppHeader extends StatelessWidget {
  const BrayanAppHeader({
    super.key,
    this.title = 'Brayan Store',
    this.onMenuPressed,
    this.onProfilePressed,
    this.searchController,
    this.searchPlaceholder = 'Search curated collections...',
    this.onSearchChanged,
    this.showSearch = true,
  });

  final String title;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onProfilePressed;
  final TextEditingController? searchController;
  final String searchPlaceholder;
  final ValueChanged<String>? onSearchChanged;
  final bool showSearch;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? BrayanColors.overlayDark : BrayanColors.overlayLight,
        border: const Border(
          bottom: BorderSide(color: BrayanColors.borderMedium),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(BrayanSpacing.headerPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BrayanIconButton(icon: Icons.menu, onPressed: onMenuPressed),
                  Text(
                    title.toUpperCase(),
                    style: BrayanTypography.headingMedium.copyWith(
                      color: BrayanColors.primary,
                      letterSpacing: -0.5,
                    ),
                  ),
                  BrayanIconButton(
                    icon: Icons.account_circle_outlined,
                    onPressed: onProfilePressed,
                  ),
                ],
              ),
            ),
            if (showSearch)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  BrayanSpacing.headerPadding,
                  0,
                  BrayanSpacing.headerPadding,
                  BrayanSpacing.headerPadding,
                ),
                child: BrayanSearchBar(
                  controller: searchController,
                  placeholder: searchPlaceholder,
                  onChanged: onSearchChanged,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
