import 'package:design_app_animation/core/app_colors.dart';
import 'package:flutter/material.dart';

class ScaleIcon extends StatelessWidget {
  const ScaleIcon({super.key, required this.animation});
final Animation<double>animation;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: animation,
        child:  Icon(
          Icons.flutter_dash,
          size: 150,
          color: AppColors.color2,),
      ),
    );
  }
}
