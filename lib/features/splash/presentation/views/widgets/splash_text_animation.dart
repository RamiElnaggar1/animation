import 'package:design_app_animation/features/splash/presentation/views/widgets/alignment_text.dart';
import 'package:flutter/material.dart';

class SplashTextAnimation extends StatefulWidget {
  const SplashTextAnimation({super.key});

  @override
  State<SplashTextAnimation> createState() => _SplashTextAnimationState();
}

class _SplashTextAnimationState extends State<SplashTextAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<AlignmentGeometry> _animation;

  @override
  void initState() {
    super.initState();
    _animationController();
    _curvedAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    debugPrint('After Super Dispose Text');
  }

  @override
  Widget build(BuildContext context) {
    return AlignmentText(animation: _animation);
  }

  _animationController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();
  }

  _curvedAnimation() {
    _animation = Tween<AlignmentGeometry>(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut,
      ),
    );
  }
}
