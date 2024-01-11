import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData lightThemeData = ThemeData(
    primarySwatch: MaterialColor(
      AppColors.primaryColor.value,
      AppColors.colorSwotch,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primaryColor),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 14),
        textStyle: const TextStyle(
          fontSize: 14,
          letterSpacing: 0.5,
        ),
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
      backgroundColor: Colors.white,
      elevation: 5,
    ),
  );
}
