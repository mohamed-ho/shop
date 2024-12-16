import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData? appTheme() {
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent));
  }
}
