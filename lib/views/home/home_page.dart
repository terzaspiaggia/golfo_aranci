import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terza_spiaggia_web/controllers/controllers_esports.dart';
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {},
            child: const Icon(Icons.download, color: Colors.white),
          ),
          const Text(
            'scarica',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
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
            child: ListView(
              children: [
                SizedBox(
                  height: height * 0.18,
                ),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: productController.products.length,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        height: height,
                        product: productController.products[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: height * 0.18,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Terza Spiaggia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  indent: 190,
                  endIndent: 190,
                ),
                Text(
                  'MENU SUSHI',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class ProductWidget extends StatelessWidget {
//   const ProductWidget({
//     super.key,
//     required this.height,
//     required this.product,
//   });

//   final double height;
//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Get.to(() => const ProductDetails(), arguments: product);
//       },
//       child: Container(
//         height: height * 0.16,
//         width: double.infinity,
//         margin: const EdgeInsets.symmetric(
//           horizontal: 10,
//         ),
//         padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 2),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               spreadRadius: 1,
//               blurRadius: 5,
//               offset: const Offset(0, 3), // changes position of shadow
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   product.number,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(width: 15),
//                 Text(
//                   product.title,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const Spacer(),
//                 Text(
//                   product.price.toString(),
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 5),
//             Text(
//               product.description,
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 14,
//               ),
//             ),
//             const SizedBox(height: 15),
//             const Text(
//               'DETAILS',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
        Get.to(() => const ProductDetails(), arguments: product);
      },
      child: Container(
        height: height * 0.2,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: Container(
                width: 100,
                height: height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 120,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        product.number,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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
                    '€ ${product.price.toStringAsFixed(2)}',
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
              top: 90,
              left: 120,
              bottom: 20,
              child: SizedBox(
                width: 300,
                child: Text(
                  product.description,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
