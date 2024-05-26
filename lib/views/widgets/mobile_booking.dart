import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:terza_spiaggia_web/animations/translate_animations.dart';
import 'package:terza_spiaggia_web/constants/strings.dart';
import 'package:terza_spiaggia_web/views/widgets/body_text_widget.dart';

class MobileBooking extends StatelessWidget {
  const MobileBooking({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height / 2.5,
          left: 0,
          right: 0,
          child: ResponsiveVisibility(
            visible: false,
            visibleConditions: [
              Condition.smallerThan(
                name: DESKTOP,
                value: true,
                // breakpoint: 30,
              ),
            ],
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: const Color(0xFF266980).withOpacity(0.5),
              ),
              child: ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context).isDesktop
                    ? ResponsiveRowColumnType.ROW
                    : ResponsiveRowColumnType.COLUMN,
                columnMainAxisAlignment: MainAxisAlignment.center,
                columnCrossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  // ResponsiveRowColumnItem(
                  //   // child: ButtonWidget(),
                  // ),
                  ResponsiveRowColumnItem(
                    child: TranslateAnimationContainer(
                      child: BodyTextWidget(
                        // alignment: TextAlign.start,
                        text: ConstStrings.body_9,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
