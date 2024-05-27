import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_framework.dart';

class BodyTitleWidget extends StatelessWidget {
  const BodyTitleWidget({
    Key? key,
    required this.text,
    required this.colour,
    required this.alignment,
  }) : super(key: key);

  final String text;
  final Color colour;
  final TextAlign alignment;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.start,
      TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(color: colour),
          ),
        ],
        style: TextStyle(
          letterSpacing: 1.5,
          fontSize: ResponsiveValue(
            context,
            defaultValue: 16.0,
            conditionalValues: [
              const Condition.equals(
                name: MOBILE,
                value: 12.0,
              ),
              const Condition.equals(
                name: TABLET,
                value: 18.0,
              ),
              const Condition.largerThan(
                name: TABLET,
                value: 24.0,
              ),
            ],
          ).value,
          overflow: TextOverflow.ellipsis,
          color: colour,
          fontWeight: FontWeight.w700,
        ),
      ),
    );

    // Text(
    //   text,
    //   textAlign: alignment,
    //   style: GoogleFonts.notoSerifHebrew(
    //       fontSize: ResponsiveValue(
    //         context,
    //         defaultValue: 12.0,
    //         conditionalValues: [
    //           const Condition.smallerThan(
    //             name: TABLET,
    //             value: 12.0,
    //           ),
    //           const Condition.equals(
    //             name: TABLET,
    //             value: 18.0,
    //           ),
    //           const Condition.largerThan(
    //             name: TABLET,
    //             value: 23.0,
    //           )
    //         ],
    //       ).value,
    //       color: colour),
    // );
  }
}
