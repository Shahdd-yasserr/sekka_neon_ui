import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/Constants/app_image.dart';
import '../../../Core/Constants/app_color.dart';

class LogoContainer extends StatelessWidget {

final double height;
final double width;
final double radius;
final bool isNeon;
final Color? glowColor;

  const LogoContainer({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
    this.isNeon = false,
    this.glowColor
  });

  @override
  Widget build(BuildContext context) {

    if (isNeon) {
      return Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(
            colors: [
              AppColor.neonCyan.withOpacity(0.3),
              AppColor.neonMagenta.withOpacity(0.3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 25.r,
              color: glowColor ?? AppColor.neonCyan,
              spreadRadius: 5,
            ),
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 40.r,
              color: (glowColor ?? AppColor.neonCyan).withOpacity(0.5),
              spreadRadius: 10,
            ),
          ],
          border: Border.all(
            color: (glowColor ?? AppColor.neonCyan).withOpacity(0.5),
            width: 1.5,
          ),
        ),
        child: Image.asset(AppImage.logo, fit: BoxFit.contain)
      );
    }

    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 20),
            blurRadius: 25.r,
          ),
        ],
      ),
      child: Image.asset(AppImage.logo, fit: BoxFit.contain)
    );
  }
}