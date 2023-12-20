import 'dart:async';

import 'package:flutter/material.dart';

class SlideFadeTransition extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final Offset beginOffset;
  final Offset endOffset;

  const SlideFadeTransition({
    super.key,
    this.duration = const Duration(seconds: 0),
    required this.child,
    required this.beginOffset,
    required this.endOffset,
  });

  @override
  State<SlideFadeTransition> createState() => _SlideFadeTransitionState();
}

class _SlideFadeTransitionState extends State<SlideFadeTransition>
    with TickerProviderStateMixin {
  late final Animation<Offset> _animationOffset;
  late final Animation<double> _animationDouble;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _slideFadeController();
    _slideFadeAnimationDouble();
    _slideFadeAnimationOffset();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    debugPrint('Dispose SlideFadeTransition Success');
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationDouble,
      child: SlideTransition(
        position: _animationOffset,
        child: widget.child,
      ),
    );
  }

  _slideFadeAnimationOffset() {
    _animationOffset = Tween<Offset>(
      begin: widget.beginOffset,
      end: widget.endOffset,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));
  }

  _slideFadeAnimationDouble() {
    _animationDouble = Tween<double>(begin: 0, end: 3).animate(_controller);
    Timer(widget.duration, () {
      _controller.forward();
    });
  }

  _slideFadeController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }
}
