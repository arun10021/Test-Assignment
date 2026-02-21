import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFF6421);
  static const Color textDark = Color(0xFF1B1E28);
  static const Color textGray = Color(0xFF7D848D);
  static const Color background = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color grayLight = Color(0xFFF7F7F9);
  static const Color starColor = Color(0xFFFFA827);
}

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const TextStyle heading3 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textGray,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textGray,
  );

  static const TextStyle label = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textGray,
    letterSpacing: 0.3,
  );
}