import 'package:design_app_animation/core/app_colors.dart';
import 'package:design_app_animation/core/helper.dart';
import 'package:flutter/material.dart';

class AlignmentText extends StatelessWidget {
  const AlignmentText({super.key, required this.animation});
final Animation<AlignmentGeometry>animation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.45,
      child: AlignTransition(
        alignment: animation,
        child: Text(
          'Welcome Back Rami',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: AppColors.color2,
          ),
        ),
      ),
    );
  }
}
