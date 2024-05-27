import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:terza_spiaggia_web/views/marketing/components/1welcome_section.dart';
import 'package:terza_spiaggia_web/views/marketing/components/2details_section.dart';
import 'package:terza_spiaggia_web/views/marketing/components/3services_section.dart';
import 'package:terza_spiaggia_web/views/marketing/components/4contact_section.dart';
import 'package:terza_spiaggia_web/views/widgets/mobile_booking.dart';
import 'package:url_launcher/url_launcher.dart';

class MarketingSite extends StatefulWidget {
  const MarketingSite({super.key});

  @override
  State<MarketingSite> createState() => _HomeViewState();
}

class _HomeViewState extends State<MarketingSite>
    with TickerProviderStateMixin {
  final GlobalKey welcomeKey1 = GlobalKey();

  late AnimationController animationController;
  late Animation _animation;

  double get _offset =>
      _scrollController.hasClients ? _scrollController.offset : 0;

  late final ScrollController _scrollController = ScrollController();

  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;
  double widgetHeight = 800;

  List<bool> widgetBooleans = [true, true, true, true];
  List<AnimationController> controllers = [];
  int currentIndex = 0;
  double initialOffsett = 0.0;
  int selectedWidgetIndex = 0;

  double scrollToWidgetCenter(BuildContext context, int targetIndex) {
    double totalHeight = 0.0 + widgetHeight * 0.130;

    // Calculate total height of widgets up to the target widget
    for (int i = 0; i < targetIndex; i++) {
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      totalHeight += renderBox.size.height;
    }

    // Calculate the target scroll offset to center the widget
    double targetOffset =
        totalHeight + screenHeight / 2 - context.size!.height / 2 - 40;

    setState(() {
      selectedWidgetIndex = targetIndex;
    });

    // Scroll to the target offset
    _scrollController.animateTo(targetOffset,
        duration: const Duration(milliseconds: 2500), curve: Curves.easeInOut);

    return targetOffset;
  }

  bool isWidgetSelected(int index) {
    return index == selectedWidgetIndex;
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 2000),
    );

    _animation = CurvedAnimation(
      curve: Curves.easeOutCubic,
      parent: animationController,
    );

    // Initialize animation controllers
    for (int i = 0; i < widgetBooleans.length; i++) {
      AnimationController controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      );

      controller.addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          // When animation is dismissed, start the next animation
          if (i < widgetBooleans.length - 1) {
            controllers[i + 1].forward();
          }
        }
      });

      controllers.add(controller);
    }

    // Listen to scroll events
    _scrollController.addListener(onScrollOffsetChanged);
    // Start the first animation
    controllers[currentIndex].forward();
  }

  onScrollOffsetChanged() {
    // Logic to determine when to trigger animations based on scroll offset
    setState(() {
      for (int i = 0; i < widgetBooleans.length; i++) {
        if (_scrollController.offset > widgetHeight * (i + 1)) {
          widgetBooleans[i] = false;
          controllers[i].forward();
        }
      }
    });
  }

  @override
  void dispose() {
    // Dispose animation controllers
    for (var controller in controllers) {
      controller.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  void repeatOnce() async {
    await animationController.forward();
    await animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('homeView'),
      floatingActionButton: _offset >= 400
          ? Padding(
              padding: const EdgeInsets.only(bottom: 20.0, right: 20),
              child: IconButton(
                onPressed: () {
                  scrollToWidgetCenter(context, 0);
                },
                icon: const Icon(
                  FontAwesomeIcons.arrowUpLong,
                  color: Colors.white,
                  size: 30,
                ),
                color: Colors.white,
              ),
            )
          : const SizedBox.shrink(),
      body: Stack(
        children: [
          Positioned(
            top: -0.2 * _offset,
            left: 0,
            right: 0,
            height: screenHeight,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent.withOpacity(0.7),
                          Colors.transparent,
                        ],
                        end: Alignment.center,
                        begin: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //  il dente
          // Positioned(
          //   top: screenHeight * 0.45 - 0.55 * _offset,
          //   right: 0,
          //   left: 0,
          //   height: screenHeight * 0.4,
          //   child: AnimatedContainer(
          //     transform: Matrix4.translationValues(0, 0.5 * _offset, 0),
          //     duration: const Duration(milliseconds: 1000),
          //     width: double.infinity,
          //     child: Image.asset(
          //       'assets/dental.png',
          //       fit: BoxFit.contain,
          //       alignment: const Alignment(0, -0.2),
          //     ),
          //   ),
          // ),

          Scrollbar(
            controller: _scrollController,
            child: AnimationLimiter(
              child: ListView(
                controller: _scrollController,
                shrinkWrap: true,
                cacheExtent: screenHeight * 1,
                children: [
                  Container(
                    color: Colors.white,
                    height: screenHeight * 0.1,
                  ),

                  // SizedBox(
                  //   height: screenHeight * 0.8,
                  //   child: MobileBooking(
                  //     screenWidth: 200,
                  //     firstTime: widgetBooleans[0],
                  //     key: const Key('mobileBooking'),
                  //   ),
                  // ),
                  WelcomeSection(
                    firstTime: widgetBooleans[0],
                    scrollController: _scrollController,
                    key: welcomeKey1,
                  ),
                  DetailsSection(
                    firstTime: widgetBooleans[1],
                    scrollController: _scrollController,
                  ),
                  // ServicesSectiorn(
                  //   firstTime: widgetBooleans[2],
                  //   scrollController: _scrollController,
                  // ),
                  ContactSection(
                    firstTime: widgetBooleans[2],
                    scrollController: _scrollController,
                  ),
                  Container(
                    color: Colors.white,
                    height: widgetHeight * 0.1,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Stack(
              children: [
                AnimatedBuilder(
                    animation: _scrollController,
                    builder: (context, child) {
                      return AnimatedOpacity(
                          opacity: _offset >= 200 ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          child: Container(
                              height: 80.0,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                  ),
                                ],
                              )));
                    }),
                Positioned(
                  top: 20.0,
                  left: 0.0,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          scrollToWidgetCenter(context, 0);
                        },
                        child: Text(
                          'WEB',
                          style: TextStyle(
                            color: _offset >= 200 ? Colors.black : Colors.red,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          scrollToWidgetCenter(context, 1);
                        },
                        child: Text(
                          'MOBILE',
                          style: TextStyle(
                            color: _offset >= 200 ? Colors.black : Colors.red,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          scrollToWidgetCenter(context, 2);
                        },
                        child: Text(
                          'MARKETING',
                          style: TextStyle(
                            color: _offset >= 200 ? Colors.black : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Positioned(
          //   top: -8,
          //   left: 0,
          //   right: 0,
          //   child: _webMenu(context),
          //   // WhenShownListener(
          //   //   initOffset: widgetHeight * 0.1,
          //   //   onWidgetShown: () => repeatOnce(),
          //   //   child: _webMenu(context),
          //   // ),
          // ),
        ],
      ),
    );
  }

  // Padding _webMenu(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         // const LogoWidget(),
  //         const Spacer(flex: 1),
  //         AnimatedBuilder(
  //           animation: _scrollController,
  //           builder: (context, child) {
  //             return Transform.translate(
  //               offset: Offset(0, (_animation.value) * 800 * 0.10),
  //               child: child,
  //             );
  //           },
  //           child: Row(
  //             children: [
  //               MenuTextButton(
  //                   text: 'ÜBER UNS',
  //                   decoration: isWidgetSelected(1)
  //                       ? TextDecoration.underline
  //                       : TextDecoration.none,
  //                   onPressed: () {
  //                     scrollToWidgetCenter(context, 1);
  //                   },
  //                   color: _offset >= 600 ? Colors.black : Colors.white),
  //               Column(
  //                 children: [
  //                   MenuTextButton(
  //                     text: 'DIENSTLEISTUNGEN',
  //                     decoration: isWidgetSelected(2)
  //                         ? TextDecoration.underline
  //                         : TextDecoration.none,
  //                     onPressed: () {
  //                       scrollToWidgetCenter(context, 2);
  //                     },
  //                     color: _offset >= 600 ? Colors.black : Colors.white,
  //                   ),
  //                 ],
  //               ),
  //               MenuTextButton(
  //                 text: 'EINZELHEITEN',
  //                 decoration: isWidgetSelected(3)
  //                     ? TextDecoration.underline
  //                     : TextDecoration.none,
  //                 onPressed: () {
  //                   scrollToWidgetCenter(context, 3);
  //                 },
  //                 color: _offset >= 600 ? Colors.black : Colors.white,
  //               ),
  //               MenuTextButton(
  //                 text: 'KONTAKT',
  //                 decoration: isWidgetSelected(4)
  //                     ? TextDecoration.underline
  //                     : TextDecoration.none,
  //                 onPressed: () {
  //                   scrollToWidgetCenter(context, 4);
  //                 },
  //                 color: _offset >= 600 ? Colors.black : Colors.white,
  //               ),
  //               const ButtonWidget(),
  //               _expandedMenu(context),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Stack _expandedMenu(BuildContext context) {
  //   return Stack(
  //     children: [
  //       ResponsiveVisibility(
  //         visible: true,
  //         visibleConditions: const [
  //           Condition.largerThan(
  //             name: MOBILE,
  //             value: false,
  //             // breakpoint: 30,
  //           ),
  //         ],
  //         child: SizedBox(
  //           height: 350,
  //           width: 250,
  //           child: ExpansionTile(
  //             key: GlobalKey(),
  //             controller: ExpansionTileController(),
  //             backgroundColor: Colors.black.withOpacity(0.6),
  //             childrenPadding: EdgeInsets.zero,
  //             title: const Text(''),
  //             initiallyExpanded: false,
  //             trailing: Icon(
  //               Icons.menu,
  //               color: _offset >= 600 ? Colors.black : Colors.white,
  //             ),
  //             children: [
  //               Column(
  //                 children: [
  //                   NavBarItem(
  //                     text: 'ÜBER UNS',
  //                     decoration: isWidgetSelected(1)
  //                         ? TextDecoration.underline
  //                         : TextDecoration.none,
  //                     onTap: () {
  //                       scrollToWidgetCenter(context, 1);
  //                     },
  //                   ),
  //                 ],
  //               ),
  //               NavBarItem(
  //                 text: 'DIENSTLEISTUNGEN',
  //                 decoration: isWidgetSelected(2)
  //                     ? TextDecoration.underline
  //                     : TextDecoration.none,
  //                 onTap: () {
  //                   scrollToWidgetCenter(context, 2);
  //                 },
  //               ),
  //               NavBarItem(
  //                 text: 'EINZELHEITEN',
  //                 decoration: isWidgetSelected(3)
  //                     ? TextDecoration.underline
  //                     : TextDecoration.none,
  //                 onTap: () {
  //                   scrollToWidgetCenter(context, 3);
  //                 },
  //               ),
  //               NavBarItem(
  //                 text: 'KONTAKT',
  //                 decoration: isWidgetSelected(4)
  //                     ? TextDecoration.underline
  //                     : TextDecoration.none,
  //                 onTap: () {
  //                   scrollToWidgetCenter(context, 4);
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Future _launchUrl() async {
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}

class WhenShownListener extends StatefulWidget {
  final VoidCallback onWidgetShown;

  final Widget child;
  final double initOffset;

  const WhenShownListener({
    Key? key,
    required this.onWidgetShown,
    required this.child,
    required this.initOffset,
  }) : super(key: key);

  @override
  State<WhenShownListener> createState() => _WhenShownListenerState();
}

class _WhenShownListenerState extends State<WhenShownListener> {
  bool hasEmitted = false;

  @override
  Widget build(BuildContext context) {
    final renderObject = context.findRenderObject() as RenderBox?;
    final offsetY = renderObject?.localToGlobal(Offset.zero).dy ?? 0;

    final deviceHeight = MediaQuery.of(context).size.height;
    if (renderObject != null &&
        offsetY < deviceHeight - widget.initOffset &&
        !hasEmitted) {
      hasEmitted = true;

      widget.onWidgetShown();
    }

    return widget.child;
  }
}
