import 'package:flutter/material.dart';

/// Border radius tokens for the Brayan Design System.
abstract final class BrayanRadius {
  static const Radius base = Radius.circular(2.0);
  static const Radius lg = Radius.circular(4.0);
  static const Radius xl = Radius.circular(8.0);
  static const Radius full = Radius.circular(12.0);

  static const BorderRadius baseBorder = BorderRadius.all(base);
  static const BorderRadius lgBorder = BorderRadius.all(lg);
  static const BorderRadius xlBorder = BorderRadius.all(xl);
  static const BorderRadius fullBorder = BorderRadius.all(full);

  // Common component radii
  static const BorderRadius card = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius chip = BorderRadius.all(Radius.circular(9999.0));
  static const BorderRadius button = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius input = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius badge = BorderRadius.all(Radius.circular(9999.0));
}
