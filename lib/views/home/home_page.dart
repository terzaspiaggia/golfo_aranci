import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:terza_spiaggia_web/constants/dynalic_values.dart';
import 'package:terza_spiaggia_web/controllers/controllers_esports.dart';
import 'package:terza_spiaggia_web/views/marketing/site_marketing.dart';
import 'package:terza_spiaggia_web/views/widgets/product_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final GlobalKey welcomeKey1 = GlobalKey();

  late AnimationController controller;
  late Animation animation;

  double get _offset =>
      _scrollController.hasClients ? _scrollController.offset : 0;

  late final ScrollController _scrollController = ScrollController();

  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;
  double widgetHeight = 500;

  List<bool> widgetBooleans = [true, true, true, true];
  List<AnimationController> controllers = [];
  int currentIndex = 0;
  double initialOffsett = 0.0;
  int selectedWidgetIndex = 0;

  double scrollToWidgetCenter(BuildContext context, int targetIndex) {
    double totalHeight = 0.0;

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
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = CurvedAnimation(
      curve: Curves.easeOutCubic,
      parent: controller,
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
    await controller.forward();
    await controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton:
          _offset < 100 || _offset > 3000 ? const DownloadButton() : null,
      backgroundColor: Colors.black,
      key: const Key('homeView'),
      body: Stack(
        children: [
          Positioned(
            top: -0.2 * _offset,
            left: 0,
            right: 0,
            height: height,
            child: const Stack(
              children: [],
            ),
          ),
          Scrollbar(
            controller: _scrollController,
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                itemCount: productController.products.length + 2,
                itemBuilder: (context, index) {
                  // Check if it's the first item in the list
                  if (index == 0) {
                    // Return a SizedBox to add 200 points space at the top
                    return SizedBox(
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Menu Sushi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: responsiveValue(context,
                                  defaultVal: 40,
                                  mobileVal: 30,
                                  tabletVal: 35,
                                  desktopVal: 40),
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (index == productController.products.length + 1) {
                    // Check if it's the last item in the list
                    // Return a SizedBox to add space at the bottom
                    return SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.all(5),
                            width: responsiveValue(context,
                                defaultVal: 200,
                                mobileVal: 150,
                                tabletVal: 180,
                                desktopVal: 200),
                            height: responsiveValue(context,
                                defaultVal: 40,
                                mobileVal: 30,
                                tabletVal: 35,
                                desktopVal: 40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.grey[400]!,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: AnimatedTextKit(
                                onTap: () {
                                  Get.to(() => const MarketingSite());
                                },
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  TyperAnimatedText(
                                    'CREATED BY ANTONIO',
                                    speed: const Duration(milliseconds: 100),
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: responsiveValue(context,
                                          defaultVal: 10,
                                          mobileVal: 12,
                                          tabletVal: 15,
                                          desktopVal: 19),
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  // TyperAnimatedText(
                                  //   'GUARDA I DETTAGLI',
                                  //   speed: const Duration(milliseconds: 100),
                                  //   textStyle: const TextStyle(
                                  //     color: Colors.white,
                                  //     fontSize: 10,
                                  //     fontFamily: 'Open Sans',
                                  //     fontWeight: FontWeight.w200,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Subtract 1 from index to get the correct product index
                    final productIndex = index - 1;
                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: 1,
                      child: ProductWidget(
                        height: height,
                        product: productController.products[productIndex],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _offset < 100 ? 1 : 0,
            child: Container(
              color: Colors.black.withOpacity(0.8),
              width: double.infinity,
              height: height * 0.10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Terza Spiaggia',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: responsiveValue(context,
                          defaultVal: 20,
                          mobileVal: 15,
                          tabletVal: 18,
                          desktopVal: 20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    height: 1,
                    width: responsiveValue(
                      context,
                      defaultVal: 10,
                      mobileVal: 120,
                      tabletVal: 140,
                      desktopVal: 160,
                    ),
                    child: Divider(
                      color: Colors.grey[400],
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              Future.delayed(const Duration(seconds: 3), () {
                downloadController.generatePdfAndDownload();
              });
            },
            child: downloadController.isLoading.value
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : const Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
          ),
          downloadController.isLoading.value
              ? Text(
                  'scaricando',
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                )
              : Text(
                  'scarica',
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
        ],
      ),
    );
  }
}
