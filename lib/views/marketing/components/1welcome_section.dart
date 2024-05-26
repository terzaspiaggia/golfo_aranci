import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:terza_spiaggia_web/constants/custom_colors.dart';
import 'package:terza_spiaggia_web/constants/dynalic_values.dart';
import 'package:terza_spiaggia_web/constants/strings.dart';
import 'package:terza_spiaggia_web/views/marketing/site_marketing.dart';
import 'package:terza_spiaggia_web/views/widgets/body_text_widget.dart';
import 'package:terza_spiaggia_web/views/widgets/body_title_widget.dart';
import 'package:terza_spiaggia_web/views/widgets/foto_container.dart';
import 'package:terza_spiaggia_web/views/widgets/section_container.dart';
import 'package:terza_spiaggia_web/views/widgets/text_container.dart';

class WelcomeSection extends StatefulWidget {
  final bool firstTime;
  final ScrollController? scrollController;

  const WelcomeSection({
    Key? key,
    required this.firstTime,
    this.scrollController,
  }) : super(key: key);

  @override
  State<WelcomeSection> createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<WelcomeSection>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() => setState(() {}));
    _animation = CurvedAnimation(
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
    double height = MediaQuery.of(context).size.height;

    return SectionContainer(
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        border: Border.all(
          color: Colors.red,
          width: 0.8,
        ),
      ),
      coulor: Colors.white,
      child: ResponsiveRowColumn(
        layout: ResponsiveBreakpoints.of(context).isDesktop
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
        rowCrossAxisAlignment: CrossAxisAlignment.stretch,
        columnMainAxisAlignment: MainAxisAlignment.spaceAround,
        columnPadding: const EdgeInsets.all(20),
        children: [
          ResponsiveRowColumnItem(
            rowFit: FlexFit.loose,
            columnFit: FlexFit.loose,
            child: AnimatedBuilder(
              animation: widget.scrollController!,
              builder: (context, child) {
                return Transform.translate(
                  offset: widget.firstTime
                      ? Offset(0, (1 - _animation.value) * height * 0.25)
                      : const Offset(0, 0),
                  child: child,
                );
              },
              child: AnimatedOpacity(
                opacity: widget.firstTime ? _animation.value : 1,
                duration: const Duration(milliseconds: 500),
                child: TextContainer(
                  colour: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveValue(
                        context,
                        defaultVal: 20,
                      ),
                      vertical: responsiveValue(
                        context,
                        defaultVal: 20,
                      ),
                    ),
                    child: const Wrap(
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        BodyTitleWidget(
                          text: ConstStrings.welcome,
                          colour: CustomColors.kTextColor,
                          alignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.check,
                              color: CustomColors.kIconsColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: BodyTextWidget(
                                text: ConstStrings.body_1,
                                color: CustomColors.kTextColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.check,
                              color: CustomColors.kIconsColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            // Expanded(
                            //   child: BodyTextWidget(
                            //     text: ConstStrings.body_2,
                            //     color: CustomColors.kTextColor,
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.check,
                              color: CustomColors.kIconsColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            // Expanded(
                            //   child: BodyTextWidget(
                            //     text: ConstStrings.body_3,
                            //     color: CustomColors.kTextColor,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFit: FlexFit.loose,
            columnFit: FlexFit.loose,
            child: WhenShownListener(
              onWidgetShown: () => _animationController.forward(),
              initOffset: 0,
              child: FotoContainer(
                  child: AnimatedBuilder(
                animation: widget.scrollController!,
                builder: (context, child) {
                  return Transform.translate(
                    offset: widget.firstTime
                        ? Offset(0, (1 - _animation.value) * height * 0.25)
                        : const Offset(0, 0),
                    child: child,
                  );
                },
                child: AnimatedOpacity(
                  opacity: widget.firstTime ? _animation.value : 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: Center(
                    child: Image.asset(
                      'assets/images/optimisation.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
