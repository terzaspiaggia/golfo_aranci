import 'package:flutter/material.dart';

class TranslateAnimationContainer extends StatefulWidget {
  const TranslateAnimationContainer({
    Key? key,
    required this.child,
    
  }) : super(key: key);

  final Widget child;
 

  @override
  State<TranslateAnimationContainer> createState() =>
      _TranslateAnimationContainerState();
}

class _TranslateAnimationContainerState
    extends State<TranslateAnimationContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isHoverTransform = Matrix4.identity()..translate(0, -5.0);
    final transform = isHovered ? isHoverTransform : Matrix4.identity();

    return MouseRegion(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: widget.child,
        ),
      ),
      onEnter: (event) => onEntred(true),
      onExit: (event) => onEntred(false),
    );
  }

  onEntred(bool isHovere) {
    setState(() {
      isHovered = isHovere;
    });
  }
}
