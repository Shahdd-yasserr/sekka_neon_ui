import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sekka/Core/Constants/app_color.dart';
import 'package:sekka/Core/Constants/app_route.dart';
import 'package:sekka/Core/Constants/app_style.dart';
import 'package:sekka/Core/Constants/cached_keys.dart';
import 'package:sekka/Core/DI/service_locator.dart';
import 'package:sekka/Core/Database/cache_helper.dart';
import 'package:sekka/Features/Splash/Widget/logo_container.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _beginAlignment;
  late Animation<Alignment> _endAlignment;
  late Animation<double> _fadeInAnimation;
  late Animation<Color?> _colorIndicatorAnimate;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _beginAlignment = Tween<Alignment>(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ).animate(_controller);

    _endAlignment = Tween<Alignment>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(_controller);

    _fadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );

    _colorIndicatorAnimate = ColorTween(
      begin: AppColor.neonCyan,
      end: AppColor.neonMagenta,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;

      final data = await getIt<CacheHelper>().getCachedValue(
        CachedKeys.onBoardingKey,
      );

      if (data == true) {
        if(FirebaseAuth.instance.currentUser != null) {
          Navigator.pushReplacementNamed(context, AppRoute.bottomNavigation);
        } else {
          Navigator.pushReplacementNamed(context, AppRoute.login);
        }
      } else {
        Navigator.pushReplacementNamed(context, AppRoute.onBoarding);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,

      child: _SplashStaticContent(),

      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Stack(
            children: [
              // Neon glow effects
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        AppColor.neonCyan.withOpacity(0.1 * _glowAnimation.value),
                        AppColor.neonMagenta.withOpacity(0.05 * _glowAnimation.value),
                        Colors.transparent,
                      ],
                      radius: 1.5,
                      center: Alignment.center,
                    ),
                  ),
                ),
              ),
              // Main content
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeTransition(
                    opacity: _fadeInAnimation,
                    child: LogoContainer(
                      height: 160.h,
                      width: 160.h,
                      radius: 40.r,
                      isNeon: true,
                      glowColor: _colorIndicatorAnimate.value ?? AppColor.neonCyan,
                    ),
                  ),

                  const SizedBox(height: 24),

                  child!,

                  const SizedBox(height: 30),

                  SizedBox(
                    width: 166.w,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: _colorIndicatorAnimate.value!.withOpacity(0.9),
                            blurRadius: 18,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: LinearProgressIndicator(
                          minHeight: 6.h,
                          valueColor: _colorIndicatorAnimate,
                          backgroundColor: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ),

                   SizedBox(height: 15.h),

                  Text(
                    "loading your journey..",
                    style: AppStyle.regular18RobotoWhite.copyWith(
                      fontSize: 14.sp,
                      shadows: [
                        Shadow(
                          color: _colorIndicatorAnimate.value!.withOpacity(0.5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SplashStaticContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Sekka",
            style: AppStyle.bold48RobotoWhite.copyWith(
              shadows: [
                Shadow(
                  color: AppColor.neonCyan.withOpacity(0.8),
                  blurRadius: 20,
                ),
                Shadow(
                  color: AppColor.neonMagenta.withOpacity(0.6),
                  blurRadius: 40,
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            "Smart Transportation",
            style: AppStyle.regular18RobotoWhite.copyWith(
              color: AppColor.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
