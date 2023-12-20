import 'package:design_app_animation/core/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonLoginScreen extends StatelessWidget {

  final AnimationController controller;
  final VoidCallback pressed;
  const ButtonLoginScreen({
    super.key,
    required this.pressed,
    required this.controller,
  });



  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(begin: 1, end: 1.5).animate(controller),
      child: ElevatedButton(
        onPressed: pressed,
        style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all(AppColors.color2.withOpacity(0.3)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(AppColors.color1),
        ),
        child: const Text(
          "login",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
