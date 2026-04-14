import 'package:flutter/material.dart';
import '../atoms/brayan_text_field.dart';

/// A search bar molecule combining an icon and text input.
///
/// Matches the Brayan Design System header search bar design.
class BrayanSearchBar extends StatelessWidget {
  const BrayanSearchBar({
    super.key,
    this.controller,
    this.placeholder = 'Search curated collections...',
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final String placeholder;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return BrayanTextField(
      controller: controller,
      placeholder: placeholder,
      prefixIcon: Icons.search,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
