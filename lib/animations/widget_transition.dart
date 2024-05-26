import 'package:flutter/material.dart';

class TransitionWidget extends StatelessWidget {
  const TransitionWidget({
    super.key,
    required AnimationController animatioController,
    required this.height,
    required this.animation,
    required this.child,
  }) : _animatioController = animatioController;

  final AnimationController _animatioController;
  final double height;
  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animatioController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: child,
        );
        // .translate(
        //   offset: Offset((-height / 4) * (1 - animation.value), 0),
        //   child: child,
        // );
      },
      child: child,
    );
  }
}
