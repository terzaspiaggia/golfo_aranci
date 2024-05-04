import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';
import 'package:terza_spiaggia_web/views/product/product_detail.dart';

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
              children: [
                //  il dente
                // Positioned(
                //   top: height * 0.55 - 0.55 * _offset,
                //   right: 0,
                //   left: 0,
                //   height: height * 0.4,
                //   child: AnimatedContainer(
                //     transform: Matrix4.translationValues(0, 0.5 * _offset, 0),
                //     duration: const Duration(milliseconds: 1000),
                //     width: double.infinity,
                //     child: SizedBox(
                //       width: 600,
                //       child: Image.asset(
                //         'assets/images/IMG_0556.PNG',
                //         fit: BoxFit.contain,
                //         alignment: const Alignment(0, -0.2),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Scrollbar(
            controller: _scrollController,
            child: ListView(
              children: [
                SizedBox(
                  height: height * 0.12,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ProductWidget(
                      height: height,
                      product: Product.products[index],
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: height * 0.12,
            child: const Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'Terza Spiaggia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bodoni_Moda',
                  ),
                ),
                // const Spacer(),
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(
                //     Icons.menu,
                //     color: Colors.white,
                //   ),
                // ),
                // const SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.height,
    required this.product,
  });

  final double height;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //  Get.toNamed('/product/${product.id}');
        Get.to(() => const ProductDetails(), arguments: product);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        height: height * 0.3,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(product.image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          // margin: const EdgeInsets.fromLTRB(30, 20, 50, 10),
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
          width: 400,
          height: height * 0.26,
          child: Stack(
            children: [
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          product.id,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Bodoni_Moda',
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          product.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Bodoni_Moda',
                          ),
                        ),
                      ],
                    ),
                    Text(
                      product.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bodoni_Moda',
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 110,
                left: 0,
                bottom: 0,
                child: SizedBox(
                  width: 300,
                  child: Text(
                    product.description,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Bodoni_Moda',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
