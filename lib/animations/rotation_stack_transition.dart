import 'dart:math';

import 'package:flutter/material.dart';

class RotationStackTransitionWidget extends StatelessWidget {
  const RotationStackTransitionWidget({
    super.key,
    required AnimationController animatioController,
    required this.height,
    required this.width,
    required this.animation,
    required this.childImage,
    required this.stackChild,
  }) : _animatioController = animatioController;

  final AnimationController _animatioController;
  final double height;
  final double width;
  final Animation<double> animation;
  final Widget childImage, stackChild;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _animatioController,
          builder: (context, child) {
            return Transform.translate(
              offset:
                  Offset((width * 0.5) * (1 - _animatioController.value), 0),
              child: child,
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 30),
            height: height,
            child: Stack(
              alignment: const Alignment(0, 0.7),
              children: [
                AnimatedBuilder(
                  animation: _animatioController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: animation.value * 0.5 * pi - pi * 0.7,
                      child: child,
                    );
                  },
                  child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.7),
                          Colors.white.withOpacity(0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                childImage,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
