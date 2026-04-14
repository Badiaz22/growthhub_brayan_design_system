import 'package:flutter/material.dart';
import '../core/tokens/brayan_spacing.dart';
import '../molecules/brayan_category_chip.dart';

/// A horizontal scrollable list of category filter chips.
///
/// Used below the header for filtering products by category.
class BrayanCategoryFilter extends StatelessWidget {
  const BrayanCategoryFilter({
    super.key,
    required this.categories,
    this.selectedIndex = 0,
    this.onSelected,
  });

  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int>? onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: BrayanSpacing.chipHeight + 8,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: BrayanSpacing.sectionPadding,
        ),
        itemCount: categories.length,
        separatorBuilder: (_, _) =>
            const SizedBox(width: BrayanSpacing.chipGap),
        itemBuilder: (context, index) {
          return BrayanCategoryChip(
            label: categories[index],
            isSelected: index == selectedIndex,
            onTap: onSelected != null ? () => onSelected!(index) : null,
          );
        },
      ),
    );
  }
}
