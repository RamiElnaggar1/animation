import 'package:design_app_animation/features/splash/presentation/views/widgets/splash_icon_animation.dart';
import 'package:design_app_animation/features/splash/presentation/views/widgets/splash_text_animation.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SplashIconAnimation(),
        SplashTextAnimation(),
      ],
    );
  }
}
