import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/models/app_model/app_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static ThemeData main({
    bool isDark = false,
    Color primaryColor = AppColors.primary,
  }) {
    return ThemeData(
      fontFamily: 'Lexend',
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: primaryColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.normalBlack),
      scaffoldBackgroundColor: isDark ? AppColors.deepBlack : AppColors.white,
      cardColor: isDark ? AppColors.normalBlack : AppColors.white,
      dividerColor: isDark
          ? AppColors.white.withOpacity(0.2)
          : AppColors.normalBlack.withOpacity(0.1),
      shadowColor: isDark ? AppColors.normalBlack : AppColors.textColor,
      primarySwatch: AppColors.getMaterialColorFromColor(primaryColor),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        systemOverlayStyle:
            isDark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headlineSmall: TextStyle(
          color: Color(0xFF1C1D3E),
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        headlineMedium: TextStyle(
          color: Color(0xFF1C1D3E),
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
        displaySmall: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        displayMedium: TextStyle(
          color: AppColors.white,
          fontSize: 60,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        displayLarge: TextStyle(
          color: AppColors.white,
          fontSize: 96,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyMedium: TextStyle(
          color: AppColors.white,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyLarge: TextStyle(
          color: AppColors.white,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodySmall: TextStyle(
          color: AppColors.white,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        labelLarge: TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        titleMedium: TextStyle(
          color: Color(0xffFFFFFF),
          fontSize: 17,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        titleSmall: TextStyle(
          color: Color(0xffFFFFFF),
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
        labelSmall: TextStyle(
          color: Color(0xffFFFFFF),
          fontSize: null,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  static List<AppTheme> appThemeOptions = [
    AppTheme(
      mode: ThemeMode.light,
      title: 'Light',
      icon: Icons.brightness_5_rounded,
    ),
    AppTheme(
      mode: ThemeMode.dark,
      title: 'Dark',
      icon: Icons.brightness_2_rounded,
    ),
    AppTheme(
      mode: ThemeMode.system,
      title: 'System',
      icon: Icons.brightness_4_rounded,
    ),
  ];
}
