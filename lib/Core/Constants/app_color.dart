import 'package:flutter/material.dart';

abstract class AppColor{

// main colors - Neon Cyberpunk Theme

  // Primary Neon Colors
  static const Color neonCyan = Color(0xFF00FFFF);
  static const Color neonMagenta = Color(0xFFFF00FF);
  static const Color neonPink = Color(0xFFFF1493);
  static const Color neonPurple = Color(0xFF9D00FF);

  // Main colors (redefined for neon theme)
  static const Color main = Color(0xFF00E5FF);
  static const Color primaryColor = Color(0xFF00E5FF);
  static const Color secondary = Color(0xFFFF00E5);
  static const Color lightGreen = Color(0xFF00FF88);
  static const Color darkGreen = Color(0xFF00CC66);
  static const Color lightPurple = Color(0xFFBF00FF);
  static const Color darkPurple = Color(0xFF8B00CC);
  static const Color lightBlue = Color(0xFF00BFFF);
  static const Color darkBlue = Color(0xFF0088FF);
  static const Color greyBorder = Color(0xFF4A5568);
  static const Color pink = Color(0xFFFF0080);
  static const Color green = Color(0xFF00FF66);
  static const Color orange = Color(0xFFFF6600);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFFB0B0B0);
  static const Color offWhite = Color(0xFFF0F0F0);
  static const Color borderColor = Color(0xFF3D3D3D);
  static const Color semiTransparentBlack = Color(0x80000000);

  // Background Colors for Dark Theme
  static const Color darkBackground = Color(0xFF0A0A0A);
  static const Color darkSurface = Color(0xFF1A1A1A);
  static const Color darkCard = Color(0xFF141414);

 // Semantic Colors

  static const Color success = Color(0xFF00FF88);
  static const Color successContainer = Color(0xFF003322);
  static const Color error = Color(0xFFFF3366);
  static const Color errorContainer = Color(0xFF330011);
  static const Color warning = Color(0xFFFFAA00);
  static const Color warningContainer = Color(0xFF332200);
  static const Color info = Color(0xFF00BFFF);



  // Surface Colors - Dark Theme Optimized

  static const Color surface = Color(0xFF0A0A0A);
  static const Color surfaceVariant = Color(0xFF1A1A1A);
  static const Color background = Color(0xFF000000);
  static const Color outline = Color(0xFF333333);
  static const Color muted = Color(0xFF666666);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);

  // Gradient presets
  static List<Color> neonGradient = [
    neonCyan,
    neonMagenta,
  ];

  static List<Color> neonBluePink = [
    const Color(0xFF00D4FF),
    const Color(0xFFFF0080),
  ];

  static List<Color> neonCyanPurple = [
    const Color(0xFF00FFFF),
    const Color(0xFF9D00FF),
  ];
}