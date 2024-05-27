import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:terza_spiaggia_web/constants/custom_colors.dart';
import 'package:terza_spiaggia_web/constants/dynalic_values.dart';
import 'package:terza_spiaggia_web/constants/strings.dart';
import 'package:terza_spiaggia_web/views/marketing/site_marketing.dart';
import 'package:terza_spiaggia_web/views/widgets/body_text_widget.dart';
import 'package:terza_spiaggia_web/views/widgets/foto_container.dart';
import 'package:terza_spiaggia_web/views/widgets/section_container.dart';
import 'package:terza_spiaggia_web/views/widgets/text_container.dart';

class DetailsSection extends StatefulWidget {
  final bool firstTime;

  final ScrollController scrollController;

  const DetailsSection({
    Key? key,
    required this.firstTime,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<DetailsSection> createState() => _DetailsSectionState();
}

class _DetailsSectionState extends State<DetailsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

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
    final height = MediaQuery.of(context).size.height;
    return SectionContainer(
      height: height,
      coulor: Colors.red,
      child: AnimatedBuilder(
        animation: widget.scrollController,
        builder: (context, child) {
          return Transform.translate(
            offset: widget.firstTime
                ? Offset(0, (1 - _animation.value) * height * 0.25)
                : const Offset(0, 0),
            child: child,
          );
        },
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
              columnOrder: 0,
              rowFit: FlexFit.loose,
              columnFit: FlexFit.loose,
              child: FotoContainer(
                child: AnimatedOpacity(
                  opacity: widget.firstTime ? _animation.value : 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: WhenShownListener(
                    initOffset: 0,
                    onWidgetShown: () => _animationController.forward(),
                    child: Image.asset(
                      'assets/images/database.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            ResponsiveRowColumnItem(
              columnOrder: 1,
              rowFit: FlexFit.loose,
              columnFit: FlexFit.loose,
              child: AnimatedBuilder(
                animation: widget.scrollController,
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
                  child: TextContainer(
                    colour: CustomColors.kDentalColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsiveValue(
                          context,
                          defaultVal: 10,
                          mobileVal: 5,
                          tabletVal: 10,
                          desktopVal: 20,
                        ),
                        vertical: responsiveValue(
                          context,
                          defaultVal: 10,
                          mobileVal: 5,
                          tabletVal: 10,
                          desktopVal: 20,
                        ),
                      ),
                      child: const Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.spaceAround,
                        children: [
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
                                  text: ConstStrings.body_4,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.5,
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
                                  text: ConstStrings.body_5,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.5,
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
                                  text: ConstStrings.body_6,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // const ResponsiveRowColumnItem(child: Spacer()),
          ],
        ),
      ),
    );
  }
}
