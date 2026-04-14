import 'package:flutter/material.dart';
import '../core/tokens/brayan_colors.dart';
import '../organisms/brayan_app_header.dart';

/// A store layout template that combines header, content area and bottom nav.
///
/// This is the top-level page structure from the Brayan Design System.
/// Templates define WHERE content goes; pages fill in WHAT content is.
class BrayanStoreTemplate extends StatelessWidget {
  const BrayanStoreTemplate({
    super.key,
    required this.body,
    this.title = 'Brayan Store',
    this.onMenuPressed,
    this.onProfilePressed,
    this.searchController,
    this.onSearchChanged,
    this.showSearch = true,
    this.bottomNav,
    this.floatingActionButton,
  });

  final Widget body;
  final String title;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onProfilePressed;
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  final bool showSearch;
  final Widget? bottomNav;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? BrayanColors.backgroundDark
          : BrayanColors.backgroundLight,
      body: Column(
        children: [
          BrayanAppHeader(
            title: title,
            onMenuPressed: onMenuPressed,
            onProfilePressed: onProfilePressed,
            searchController: searchController,
            onSearchChanged: onSearchChanged,
            showSearch: showSearch,
          ),
          Expanded(child: body),
        ],
      ),
      bottomNavigationBar: bottomNav,
      floatingActionButton: floatingActionButton,
    );
  }
}
