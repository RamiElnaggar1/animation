import 'package:design_app_animation/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomListViewHomeItem extends StatefulWidget {
  final int index;

  const CustomListViewHomeItem(this.index, {Key? key}) : super(key: key);

  @override
  State<CustomListViewHomeItem> createState() => _CustomListViewHomeItemState();
}

class _CustomListViewHomeItemState extends State<CustomListViewHomeItem>
    with SingleTickerProviderStateMixin {
  static bool isStartAnimation = true;
  late final AnimationController controller;
  late final Animation<Offset> animationOffset;
  late final Animation<double> animationDouble;

  @override
  void initState() {
    super.initState();

    _animationControllerItemList();
    _animationDoubleItemList();
    _animationOffsetItemList();

    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        isStartAnimation = false;
      });
    });


  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animationOffset,
      child: FadeTransition(
          opacity: animationDouble,
          child: Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
                color: AppColors.color1,
                borderRadius: BorderRadius.circular(15)),
          )),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    debugPrint('Controller List Item DisPose Success');
  }

  _animationOffsetItemList() {
    animationOffset = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutQuad));
  }

  _animationDoubleItemList() {
    animationDouble = Tween<double>(begin: 0, end: 3)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOutQuad));
  }

  _animationControllerItemList() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds:  isStartAnimation ? widget.index * 200:0,
      ),
    )..forward();
  }
}
