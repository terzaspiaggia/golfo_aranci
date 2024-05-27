import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:terza_spiaggia_web/constants/custom_colors.dart';
import 'package:terza_spiaggia_web/constants/dynalic_values.dart';
import 'package:terza_spiaggia_web/constants/images.dart';
import 'package:terza_spiaggia_web/constants/strings.dart';
import 'package:terza_spiaggia_web/views/marketing/site_marketing.dart';
import 'package:terza_spiaggia_web/views/widgets/body_text_widget.dart';
import 'package:terza_spiaggia_web/views/widgets/body_title_widget.dart';
import 'package:terza_spiaggia_web/views/widgets/caroussel_widget.dart';
import 'package:terza_spiaggia_web/views/widgets/section_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  final ScrollController? scrollController;
  final bool firstTime;

  const ContactSection({
    Key? key,
    this.scrollController,
    required this.firstTime,
  }) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection>
    with SingleTickerProviderStateMixin {
  late final Completer<GoogleMapController> _controller = Completer();

  late AnimationController _animationController;
  late Animation _animation;

  final lat = 51.204720268379184;
  final lon = 6.410291258478748;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(51.20482774631489, 6.410287954234193),
    zoom: 14.4746,
  );

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
    // _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;
    return SectionContainer(
      height: height,
      coulor: const Color(0xFFf4f6f3),
      child: AnimatedBuilder(
        animation: widget.scrollController!,
        builder: (context, child) {
          return Transform.translate(
            offset: widget.firstTime
                ? Offset(0, (1 - _animation.value) * height * 0.10)
                : const Offset(0, 0),
            child: child,
          );
        },
        child: WhenShownListener(
          initOffset: 0,
          onWidgetShown: () => _animationController.forward(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context).isDesktop
                    ? ResponsiveRowColumnType.ROW
                    : ResponsiveRowColumnType.COLUMN,
                rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                columnMainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ResponsiveRowColumnItem(
                    rowFit: FlexFit.loose,
                    rowFlex: 1,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                                child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Stack(
                                children: [
                                  const CarousselWidget(
                                    imagesList: PathImages.imagesList,
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.grey,
                                        size: responsiveValue(context,
                                            defaultVal: 20,
                                            mobileVal: 20,
                                            tabletVal: 30,
                                            desktopVal: 40),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                          },
                        );
                      },
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 550,
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageWidget(
                                  image: PathImages.image0,
                                ),
                                ImageWidget(
                                  image: PathImages.image2,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ImageWidget(
                                  image: PathImages.image3,
                                ),
                                ImageWidget(
                                  image: PathImages.image4,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFit: FlexFit.loose,
                    rowFlex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: responsiveValue(
                          context,
                          defaultVal: 20,
                          mobileVal: 20,
                          tabletVal: 20,
                          desktopVal: 20,
                        ),
                        top: responsiveValue(
                          context,
                          defaultVal: 20,
                          mobileVal: 20,
                          tabletVal: 20,
                          desktopVal: 20,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BodyTitleWidget(
                            alignment: TextAlign.start,
                            text: ConstStrings.visitTitle,
                            colour: Colors.black,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: BodyTextWidget(
                                  text: ConstStrings.addressDescriptin,
                                  color: CustomColors.kDentalColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.person,
                                color: CustomColors.kDentalColor,
                                size: responsiveValue(
                                  context,
                                  defaultVal: 20,
                                  mobileVal: 20,
                                  tabletVal: 25,
                                  desktopVal: 30,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                ConstStrings.myName,
                                style: TextStyle(
                                  color: CustomColors.kDentalColor,
                                  fontSize: responsiveValue(
                                    context,
                                    defaultVal: 20,
                                    mobileVal: 20,
                                    tabletVal: 25,
                                    desktopVal: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: CustomColors.kDentalColor,
                                size: responsiveValue(
                                  context,
                                  defaultVal: 20,
                                  mobileVal: 20,
                                  tabletVal: 25,
                                  desktopVal: 30,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Expanded(
                                child: BodyTextWidget(
                                  text: ConstStrings.address,
                                  color: CustomColors.kDentalColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: CustomColors.kDentalColor,
                                size: responsiveValue(
                                  context,
                                  defaultVal: 20,
                                  mobileVal: 20,
                                  tabletVal: 25,
                                  desktopVal: 30,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Expanded(
                                child: BodyTextWidget(
                                  text: ConstStrings.phoneNumber,
                                  color: CustomColors.kDentalColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchMaps(double lat, double lon) async {
    Uri googleUrl =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lon');
    // 'comgooglemaps://?center=$lat,$lon';
    Uri appleUrl =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lon');
    if (await canLaunchUrl(googleUrl)) {
      print('launching com googleUrl');
      await launchUrl(googleUrl);
    } else if (await canLaunchUrl(appleUrl)) {
      print('launching apple url');
      await launchUrl(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }
}

class ImageWidget extends StatelessWidget {
  final String image;

  const ImageWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(2.5),
        width: responsiveValue(
          context,
          defaultVal: 200,
          mobileVal: 110,
          tabletVal: 140,
          desktopVal: 200,
        ),
        height: responsiveValue(
          context,
          defaultVal: 200,
          mobileVal: 110,
          tabletVal: 140,
          desktopVal: 200,
        ),
        child: Image.asset(
          image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
