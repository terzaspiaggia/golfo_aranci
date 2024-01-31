import 'package:flutter/material.dart';

import 'package:terza_spiaggia_web/constants/dynalic_values.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    Key? key,
    required this.height,
    required this.image,
    required this.text,
    required this.title,
    required this.padding,
    this.bottom,
    this.left,
    this.right,
    this.top,
  }) : super(key: key);

  final double height;
  final NetworkImage image;
  final String text;
  final String title;
  final double padding;
  final double? bottom;
  final double? left;
  final double? right;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height * 0.8,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              scale: responsiveValue(
                context,
                defaultVal: 1,
                mobileVal: 0.2,
                tabletVal: 0.5,
                desktopVal: 1,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: bottom,
          left: left,
          right: right,
          top: top,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: padding,
            ),
            width: 400,
            height: height * 0.26,
            color: Colors.black.withOpacity(0.3),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: responsiveValue(
                      context,
                      defaultVal: 30,
                      mobileVal: 20,
                      tabletVal: 15,
                      desktopVal: 30,
                    ),
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  maxLines: 5,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
