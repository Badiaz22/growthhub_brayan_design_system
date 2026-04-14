import 'package:flutter/material.dart';
import 'package:brayan_design_system/brayan_design_system.dart';
import 'pages/atoms/atoms_showcase_page.dart';
import 'pages/molecules/molecules_showcase_page.dart';
import 'pages/organisms/organisms_showcase_page.dart';
import 'pages/templates/templates_showcase_page.dart';
import 'pages/full_page/full_page_showcase.dart';

void main() {
  runApp(const ShowcaseApp());
}

class ShowcaseApp extends StatefulWidget {
  const ShowcaseApp({super.key});

  @override
  State<ShowcaseApp> createState() => _ShowcaseAppState();
}

class _ShowcaseAppState extends State<ShowcaseApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brayan Design System Showcase',
      debugShowCheckedModeBanner: false,
      theme: BrayanTheme.lightWithGoogleFonts,
      darkTheme: BrayanTheme.darkWithGoogleFonts,
      themeMode: _themeMode,
      home: ShowcaseHome(onToggleTheme: _toggleTheme),
    );
  }
}

class ShowcaseHome extends StatelessWidget {
  const ShowcaseHome({super.key, required this.onToggleTheme});

  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? BrayanColors.backgroundDark
          : BrayanColors.backgroundLight,
      appBar: AppBar(
        title: Text(
          'BRAYAN DESIGN SYSTEM',
          style: BrayanTypography.headingMedium.copyWith(
            color: BrayanColors.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: BrayanColors.primary,
            ),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(BrayanSpacing.sectionPadding),
        children: [
          const SizedBox(height: 16),
          BrayanText(
            'Atomic Design Showcase',
            variant: BrayanTextVariant.headingLarge,
            color: isDark
                ? BrayanColors.textDarkPrimary
                : BrayanColors.textPrimary,
          ),
          const SizedBox(height: 8),
          BrayanText(
            'A premium e-commerce design system built with Flutter, organized following Atomic Design methodology.',
            variant: BrayanTextVariant.bodyLarge,
            color: BrayanColors.textSecondary,
          ),
          const SizedBox(height: 32),
          _ShowcaseCard(
            icon: Icons.circle,
            title: 'Atoms',
            description:
                'Foundational building blocks: buttons, text, icons, inputs, badges, images.',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AtomsShowcasePage()),
            ),
          ),
          const SizedBox(height: 12),
          _ShowcaseCard(
            icon: Icons.widgets_outlined,
            title: 'Molecules',
            description:
                'Combinations of atoms: search bar, category chips, navigation items, section headers.',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MoleculesShowcasePage()),
            ),
          ),
          const SizedBox(height: 12),
          _ShowcaseCard(
            icon: Icons.dashboard_outlined,
            title: 'Organisms',
            description:
                'Complex components: app header, product cards, product grid, bottom nav, category filter.',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const OrganismsShowcasePage()),
            ),
          ),
          const SizedBox(height: 12),
          _ShowcaseCard(
            icon: Icons.web_outlined,
            title: 'Templates',
            description:
                'Page-level layout structures: store template with header, content area, and bottom nav.',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TemplatesShowcasePage()),
            ),
          ),
          const SizedBox(height: 12),
          _ShowcaseCard(
            icon: Icons.phone_android,
            title: 'Pages',
            description:
                'Full pages with real data: complete Brayan Store e-commerce experience.',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FullPageShowcase()),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _ShowcaseCard extends StatelessWidget {
  const _ShowcaseCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark ? BrayanColors.cardDark : BrayanColors.cardLight,
          borderRadius: BrayanRadius.card,
          border: Border.all(color: BrayanColors.borderMedium),
          boxShadow: const [BrayanShadows.cardSm],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: BrayanColors.primaryLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: BrayanColors.primary, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: BrayanTypography.headingSmall.copyWith(
                      color: isDark
                          ? BrayanColors.textDarkPrimary
                          : BrayanColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: BrayanTypography.bodySmall.copyWith(
                      color: BrayanColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: BrayanColors.primary),
          ],
        ),
      ),
    );
  }
}
