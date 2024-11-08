import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primaryBlue,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.gold,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 16,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryBlue,
      secondary: AppColors.gold,
      surface: AppColors.surface,
      background: AppColors.background,
    ),
  );
} 