import 'package:design_app_animation/core/app_colors.dart';
import 'package:design_app_animation/features/app/views/app_home.dart';
import 'package:design_app_animation/features/splash/presentation/views/splash_screen_home.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor:AppColors.color1,
          selectionColor: AppColors.color1,
        ),
      ),
      home: const AppHome(),
    );
  }
}

