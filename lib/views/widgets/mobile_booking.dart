import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:terza_spiaggia_web/constants/custom_colors.dart';
import 'package:terza_spiaggia_web/constants/dynalic_values.dart';

class MobileBooking extends StatefulWidget {
  const MobileBooking({
    Key? key,
    required this.screenWidth,
    required this.firstTime,
  }) : super(key: key);

  final double screenWidth;
  final bool firstTime;

  @override
  State<MobileBooking> createState() => _MobileBookingState();
}

class _MobileBookingState extends State<MobileBooking>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 1000),
    );
    animation = CurvedAnimation(
      curve: Curves.easeOutCubic,
      parent: _animationController,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height / 2.5,
          left: responsiveValue(context,
              defaultVal: 0.0,
              mobileVal: 0.0,
              tabletVal: 100.0,
              desktopVal: 250.0),
          right: 0.0,
          child: AnimatedOpacity(
            opacity: widget.firstTime ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Container(
              color: CustomColors.kDentalColor,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(width: 20.0, height: 100.0),
                  const Text(
                    'SII',
                    style: TextStyle(
                      fontSize: 63.0,
                      fontFamily: 'Horizon',
                      color: CustomColors.kIconsColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20.0, height: 100.0),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Horizon',
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        RotateAnimatedText(
                          'INNOVATIVO',
                          textStyle: const TextStyle(
                            color: CustomColors.kTextColor,
                          ),
                        ),
                        RotateAnimatedText(
                          'DINAMICO',
                          textStyle: const TextStyle(
                            color: CustomColors.kTextColor,
                          ),
                        ),
                        RotateAnimatedText(
                          'UNICO',
                          textStyle: const TextStyle(
                            color: CustomColors.kTextColor,
                          ),
                        ),
                      ],
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
