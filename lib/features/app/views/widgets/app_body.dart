import 'package:design_app_animation/core/app_colors.dart';
import 'package:design_app_animation/features/app/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

final listKey = GlobalKey<AnimatedListState>();

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultColor,

      body: SafeArea(child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
        return CustomListViewHomeItem(index);
      })),
    );
  }
}
