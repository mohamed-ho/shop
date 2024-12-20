import 'package:flutter/material.dart';

import 'package:shop/core/constant/app_colors.dart';

class AppTheme {
  static ThemeData? appTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColors.mainAppColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed),
    );
  }
}
