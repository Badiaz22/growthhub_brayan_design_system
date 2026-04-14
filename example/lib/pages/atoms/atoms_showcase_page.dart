import 'package:flutter/material.dart';
import 'package:brayan_design_system/brayan_design_system.dart';
import '../showcase_scaffold.dart';
import 'widgets/section_title.dart';
import 'widgets/badge_demo.dart';

/// Showcase page for Atoms — the foundational building blocks.
class AtomsShowcasePage extends StatelessWidget {
  const AtomsShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark
        ? BrayanColors.textDarkPrimary
        : BrayanColors.textPrimary;

    return ShowcaseScaffold(
      title: 'Atoms',
      children: [
        // ── BrayanText ──
        SectionTitle('BrayanText'),
        const SizedBox(height: 8),
        BrayanText(
          'Heading Large',
          variant: BrayanTextVariant.headingLarge,
          color: textColor,
        ),
        const SizedBox(height: 4),
        BrayanText(
          'Heading Medium',
          variant: BrayanTextVariant.headingMedium,
          color: textColor,
        ),
        const SizedBox(height: 4),
        BrayanText(
          'Heading Small',
          variant: BrayanTextVariant.headingSmall,
          color: textColor,
        ),
        const SizedBox(height: 4),
        BrayanText(
          'SECTION TITLE',
          variant: BrayanTextVariant.sectionTitle,
          uppercase: true,
          color: BrayanColors.textSecondary,
        ),
        const SizedBox(height: 4),
        BrayanText(
          'Body Large — The quick brown fox jumps over the lazy dog.',
          variant: BrayanTextVariant.bodyLarge,
          color: textColor,
        ),
        const SizedBox(height: 4),
        BrayanText(
          'Body Medium — The quick brown fox jumps over the lazy dog.',
          variant: BrayanTextVariant.bodyMedium,
          color: textColor,
        ),
        const SizedBox(height: 4),
        BrayanText(
          'Body Small — The quick brown fox jumps over the lazy dog.',
          variant: BrayanTextVariant.bodySmall,
          color: BrayanColors.textSecondary,
        ),
        const SizedBox(height: 4),
        BrayanText(
          'LABEL MEDIUM',
          variant: BrayanTextVariant.labelMedium,
          uppercase: true,
          color: BrayanColors.primary,
        ),
        const SizedBox(height: 4),
        BrayanText(
          '\$109.95',
          variant: BrayanTextVariant.price,
          color: textColor,
        ),
        const SizedBox(height: 4),
        BrayanText(
          'View All',
          variant: BrayanTextVariant.link,
          color: BrayanColors.primary,
        ),
        const Divider(height: 32),

        // ── BrayanButton ──
        SectionTitle('BrayanButton'),
        const SizedBox(height: 12),
        const BrayanButton(
          label: 'Primary Button',
          variant: BrayanButtonVariant.primary,
        ),
        const SizedBox(height: 8),
        const BrayanButton(
          label: 'Secondary Button',
          variant: BrayanButtonVariant.secondary,
        ),
        const SizedBox(height: 8),
        const BrayanButton(
          label: 'Ghost Button',
          variant: BrayanButtonVariant.ghost,
        ),
        const SizedBox(height: 8),
        const BrayanButton(
          label: 'With Icon',
          variant: BrayanButtonVariant.primary,
          icon: Icons.shopping_bag,
        ),
        const SizedBox(height: 8),
        const BrayanButton(
          label: 'Full Width',
          variant: BrayanButtonVariant.primary,
          isFullWidth: true,
        ),
        const Divider(height: 32),

        // ── BrayanIconButton ──
        SectionTitle('BrayanIconButton'),
        const SizedBox(height: 12),
        Row(
          children: [
            BrayanIconButton(icon: Icons.menu, onPressed: () {}),
            const SizedBox(width: 12),
            BrayanIconButton(
              icon: Icons.account_circle_outlined,
              onPressed: () {},
            ),
            const SizedBox(width: 12),
            BrayanIconButton(
              icon: Icons.add_shopping_cart,
              onPressed: () {},
              filled: true,
            ),
            const SizedBox(width: 12),
            BrayanIconButton(icon: Icons.search, onPressed: () {}),
          ],
        ),
        const Divider(height: 32),

        // ── BrayanTextField ──
        SectionTitle('BrayanTextField'),
        const SizedBox(height: 12),
        const BrayanTextField(placeholder: 'Enter text...'),
        const SizedBox(height: 8),
        const BrayanTextField(
          placeholder: 'With icon prefix',
          prefixIcon: Icons.email,
        ),
        const Divider(height: 32),

        // ── BrayanBadge ──
        SectionTitle('BrayanBadge'),
        const SizedBox(height: 12),
        const Row(
          children: [
            BadgeDemo(count: 1),
            SizedBox(width: 16),
            BadgeDemo(count: 5),
            SizedBox(width: 16),
            BadgeDemo(count: 99),
            SizedBox(width: 16),
            BadgeDemo(count: 150),
          ],
        ),
        const Divider(height: 32),

        // ── BrayanImage ──
        SectionTitle('BrayanImage'),
        const SizedBox(height: 12),
        const SizedBox(
          width: 200,
          child: BrayanImage(
            imageUrl:
                'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png',
            borderRadius: BrayanRadius.card,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
