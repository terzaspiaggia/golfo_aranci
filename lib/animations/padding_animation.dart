import 'package:flutter/material.dart';
import 'package:terza_spiaggia_web/constants.dart';

class PaddingAnimationContainer extends StatefulWidget {
  const PaddingAnimationContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<PaddingAnimationContainer> createState() =>
      _PaddingAnimationContainerState();
}

class _PaddingAnimationContainerState extends State<PaddingAnimationContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          boxShadow: [if (isHovered) kDefaultCardShadow],
        ),
        child: widget.child,
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


// AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           padding: const EdgeInsets.symmetric(
//             vertical: kDefaultPadding / 2,
//             horizontal: kDefaultPadding * 1.5,
//           ),
//           decoration: BoxDecoration(
//             color: widget.color,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [if (isHover) kDefaultCardShadow],