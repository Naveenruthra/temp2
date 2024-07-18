import 'package:flutter/material.dart';

/// Provides responsive size values based on the current screen size.
class ResponsiveSize {
  // This creates a singleton instance of ResponsiveSize.
  static final ResponsiveSize _instance = ResponsiveSize._internal();

  // Named constructor
  factory ResponsiveSize() {
    return _instance;
  }

  // This is the actual constructor that is called only once.
  ResponsiveSize._internal();

  // These are your named constants.
  static const double maxWidth = 600;
  static const double minHeight = 100;
  static const double defaultHeight = 30;
  static const double alternateHeight = 40;
  static const int defaultCount = 6;
  static const int alternateCount = 3;

  bool isWide(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width > maxWidth;
  }

  double width(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width > maxWidth ? maxWidth : width;
  }

  double height(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return height > minHeight ? defaultHeight : alternateHeight;
  }

  double heightBasedOnWidth(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return width > maxWidth ? alternateHeight : defaultHeight;
  }

  int gridCount(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width > maxWidth ? defaultCount : alternateCount;
  }
}
