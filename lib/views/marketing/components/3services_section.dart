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
import 'package:terza_spiaggia_web/views/widgets/styles.dart';
import 'package:terza_spiaggia_web/views/widgets/text_container.dart';

class ServicesSection extends StatefulWidget {
  final ScrollController? scrollController;

  final bool firstTime;

  const ServicesSection({
    Key? key,
    this.scrollController,
    required this.firstTime,
  }) : super(key: key);

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection>
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

  Widget _titleAndDescription(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: responsiveValue(
          context,
          defaultVal: 0,
          mobileVal: 0,
          desktopVal: 20,
        )),
        Text(
          ConstStrings.servicesTitle,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: responsiveValue(
              context,
              defaultVal: 0,
              mobileVal: 10,
              desktopVal: 30,
            ),
            fontWeight: FontWeight.bold,
            color: CustomColors.kTextColor,
          ),
        ),
        SizedBox(
          height: responsiveValue(context,
              defaultVal: 0, mobileVal: 0, desktopVal: 10),
        ),
        ResponsiveVisibility(
          visible: false,
          visibleConditions: const [
            Condition.largerThan(
              name: TABLET,
              value: true,
              // breakpoint: 30,
            ),
          ],
          child: Text(
            ConstStrings.intro,
            style: TextStyles.regularTextStyle(
              context,
              CustomColors.kTextColor,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildProducts() {
    return Column(
      children: [
        for (var i = 0; i < ConstStrings.products.length; i++)
          TextCheckWidget(text: ConstStrings.products[i])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SectionContainer(
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        border: Border.all(
          color: Colors.white,
          width: 0.8,
        ),
      ),
      coulor: CustomColors.kDentalColor,
      child: ResponsiveRowColumn(
        layout: ResponsiveBreakpoints.of(context).isDesktop
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
        rowCrossAxisAlignment: CrossAxisAlignment.stretch,
        columnMainAxisAlignment: MainAxisAlignment.spaceAround,
        columnPadding: const EdgeInsets.all(10),
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
                curve: Curves.easeInOut,
                child: TextContainer(
                  colour: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveValue(
                        context,
                        defaultVal: 50,
                        mobileVal: 5,
                        desktopVal: 60,
                      ),
                      vertical: responsiveValue(
                        context,
                        defaultVal: 20,
                      ),
                    ),
                    child: ListView(
                      children: [
                        _titleAndDescription(context),
                        const SizedBox(
                          height: 15,
                        ),
                        _buildProducts()
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
                    child: Image.asset(
                      'assets/doctors/image5.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextCheckWidget extends StatelessWidget {
  final String text;

  const TextCheckWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          FontAwesomeIcons.check,
          color: CustomColors.kIconsColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: BodyTextWidget(
            text: text,
            color: CustomColors.kTextColor,
          ),
        ),
      ],
    );
  }
}
