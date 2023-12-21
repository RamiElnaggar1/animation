import 'package:design_app_animation/core/app_colors.dart';
import 'package:design_app_animation/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashScreenHome extends StatelessWidget {
  const SplashScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultColor,
      body: const SplashViewBody(),
    );

  }
}
