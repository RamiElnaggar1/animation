import 'package:design_app_animation/core/app_colors.dart';
import 'package:design_app_animation/features/login/views/widgets/login_screen_body.dart';
import 'package:flutter/material.dart';

class LoginScreenHome extends StatelessWidget {
  const LoginScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultColor,
      body:const LoginScreenBody(),
    );
  }
}
