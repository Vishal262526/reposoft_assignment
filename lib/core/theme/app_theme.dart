import 'package:assignment/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: kWhiteColor,
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0.0,
      centerTitle: true,
      backgroundColor: kWhiteColor,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: LightThemeColors.placeholder,
      ),
      fillColor: LightThemeColors.primaryLight,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: LightThemeColors.secondaryDark,
        foregroundColor: kBlackColor,
      ),
    ),
  );
}
