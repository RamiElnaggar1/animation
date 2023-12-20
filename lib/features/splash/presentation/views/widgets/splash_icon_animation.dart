import 'dart:async';

import 'package:design_app_animation/core/helper.dart';
import 'package:design_app_animation/features/login/views/login_screen_home.dart';
import 'package:design_app_animation/features/splash/presentation/views/widgets/scale_icon.dart';
import 'package:flutter/material.dart';

class SplashIconAnimation extends StatefulWidget {
  const SplashIconAnimation({super.key});

  @override
  State<SplashIconAnimation> createState() => _SplashIconAnimationState();
}

class _SplashIconAnimationState extends State<SplashIconAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController();
    _curvedAnimation();
    _navigatorLoginScreen();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    debugPrint('After Super Dispose Icon');
  }

  @override
  Widget build(BuildContext context) {
    return ScaleIcon(animation: _animation);
  }

  _animationController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();
  }

  _curvedAnimation() {
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );
  }

  _navigatorLoginScreen() {
    Timer(const Duration(seconds: 2), () {
      context.navigatorAndRemoveScreen(const LoginScreenHome());
    });
  }
}
