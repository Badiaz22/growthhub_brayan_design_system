import 'package:flutter/material.dart';
import 'package:brayan_design_system/brayan_design_system.dart';
import 'pages/home/showcase_home.dart';

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
