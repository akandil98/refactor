import 'package:flutter/material.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Colors.black,
    hintColor: AppColors.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppStrings.fontFamily,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      centerTitle: true,
      color: Colors.black,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          height: 1.3,
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Colors.black,
      showUnselectedLabels: true,
      unselectedItemColor: AppColors.hint,
      selectedItemColor: Colors.greenAccent,
    ),
  );
}
