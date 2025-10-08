import 'package:flutter/material.dart';

/// App color constants following the design system
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF0066FF);
  static const Color primaryDark = Color(0xFF0052CC);
  static const Color primaryLight = Color(0xFF3385FF);

  // Background Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundSecondary = Color(0xFFF5F5F5);
  static const Color backgroundTertiary = Color(0xFFE8E8E8);

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textTertiary = Color(0xFF999999);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Status Colors
  static const Color success = Color(0xFF00C853);
  static const Color error = Color(0xFFFF3B30);
  static const Color warning = Color(0xFFFFB800);
  static const Color info = Color(0xFF2196F3);

  // Border Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderLight = Color(0xFFF0F0F0);

  // Shadow Colors
  static const Color shadow = Color(0x1A000000);
  static const Color shadowLight = Color(0x0D000000);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Card Colors
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardShadow = Color(0x0A000000);
}
