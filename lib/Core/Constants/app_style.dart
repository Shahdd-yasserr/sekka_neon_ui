import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'app_color.dart';

abstract class AppStyle {

  static final TextStyle bold48RobotoWhite = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 48.sp,
      fontFamily: 'Roboto',
      color: Colors.white,
      shadows: [
        Shadow(
          color: AppColor.neonCyan.withOpacity(0.5),
          blurRadius: 10,
        ),
      ],
  );

  static final TextStyle regular11RobotoGrey = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 11.sp,
      fontFamily: 'Roboto',
      color: AppColor.textSecondary
  );

  static final TextStyle w60012RobotoGrey = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12.sp,
      fontFamily: 'Roboto',
      color: AppColor.textSecondary
  );

  static const LinearGradient brandGradient = LinearGradient(
    colors: [AppColor.neonCyan, AppColor.neonMagenta, AppColor.neonPink],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final TextStyle regular18RobotoWhite = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18.sp,
      fontFamily: 'Roboto',
      color: Colors.white
  );

  static final TextStyle bold14RobotoBlue = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
      fontFamily: 'Roboto',
      color: AppColor.neonCyan
  );

  static final TextStyle regular24RobotoBlack = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24.sp,
      fontFamily: 'Roboto',
      color: Colors.white
  );

  static final TextStyle regular16RobotoBlack = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      fontFamily: 'Roboto',
      color: AppColor.textPrimary
  );
  static final TextStyle regular16RobotoGrey = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      fontFamily: 'Roboto',
      color: AppColor.textSecondary
  );

  // Neon text styles
  static final TextStyle neonTitle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 32.sp,
      fontFamily: 'Roboto',
      color: Colors.white,
      shadows: [
        Shadow(color: AppColor.neonCyan, blurRadius: 20),
        Shadow(color: AppColor.neonMagenta, blurRadius: 40),
      ],
  );

  static final TextStyle neonSubtitle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      fontFamily: 'Roboto',
      color: AppColor.textSecondary,
      letterSpacing: 1.2,
  );
}