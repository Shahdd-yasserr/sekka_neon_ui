import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/Constants/app_color.dart';

class ImageBackground extends StatelessWidget {
final Widget child;
  const ImageBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
     return  Container(
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height
    ),
      decoration: BoxDecoration(
        color: AppColor.background,
        gradient: RadialGradient(
          colors: [
            AppColor.neonCyan.withOpacity(0.05),
            AppColor.neonMagenta.withOpacity(0.03),
            AppColor.background,
          ],
          radius: 2,
          center: Alignment.topCenter,
        ),
      ),
      child: Stack(
        children: [
          // Neon line decorations
          Positioned(
            top: 100.h,
            left: 0,
            right: 0,
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColor.neonCyan.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 200.h,
            left: 0,
            right: 0,
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColor.neonMagenta.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Main content
          child,
        ],
      ),
    );
  }
}