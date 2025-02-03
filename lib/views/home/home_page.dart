import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:terza_spiaggia_web/controllers/controllers_esports.dart';
import 'package:terza_spiaggia_web/views/marketing/site_marketing.dart';
import 'package:terza_spiaggia_web/views/widgets/product_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _controller;
  bool showOnlyOnline = false; // 🔥 Filter for online products

  double get _offset =>
      _scrollController.hasClients ? _scrollController.offset : 0;
  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _scrollController.addListener(_onScrollOffsetChanged);
  }

  void _onScrollOffsetChanged() {
    setState(() {}); // Rebuild UI on scroll
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// 🔥 Responsive Side Container (Hides on Mobile)
  Widget _buildSideContainer() {
    return Container(
      width: 250, // Fixed width for sidebar
      height: screenHeight,
      color: Colors.grey[900], // Background color
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const SizedBox(height: 10),

          SizedBox(
            height: 200,
            width: screenWidth,
            child: Card(
              color: Colors.grey[800],
              child: const Text(
                "LOREM IPSUM",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const Divider(color: Colors.grey),
          SizedBox(
            height: 200,
            width: screenWidth,
            child: Card(
              color: Colors.grey[800],
              child: const Text(
                "LOREM IPSUM",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const Divider(color: Colors.grey),
          SizedBox(
            height: 200,
            width: screenWidth,
            child: Card(
              color: Colors.grey[800],
              child: const Text(
                "LOREM IPSUM",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const Spacer(),
          // const Text(
          //   "Additional Content",
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 16,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return Obx(() {
      final products = productController.products.toList();

      if (products.isEmpty) {
        return const Center(
            child: Text("No products found",
                style: TextStyle(color: Colors.white)));
      }

      final totalItems = products.length + 2; // ✅ Includes header + footer

      return Scrollbar(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: MasonryGridView.count(
            controller: _scrollController,
            crossAxisCount: screenWidth > 1200
                ? 4
                : screenWidth > 800
                    ? 3
                    : 2, // ✅ Fully responsive
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemCount: totalItems,
            itemBuilder: (context, index) {
              if (index == 0) return _buildHeader();
              if (index == totalItems - 1) return _buildFooter();

              final productIndex = index - 1; // ✅ Adjusted for correct indexing

              return AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: 1,
                child: ProductWidget(
                    height: screenHeight, product: products[productIndex]),
              );
            },
          ),
        ),
      );
    });
  }

  /// 🔥 Header
  Widget _buildHeader() {
    return SizedBox(
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Menu Sushi',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }

  /// 🔥 Footer
  Widget _buildFooter() {
    return SizedBox(
      height: 100,
      child: Center(
        child: GestureDetector(
          onTap: () => Get.to(() => const MarketingSite()),
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(5),
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[400]!, width: 1),
            ),
            child: Center(
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText(
                    'CREATED BY ANTONIO',
                    speed: const Duration(milliseconds: 100),
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 🔥 Layout with Side Container (Hides on Mobile)
  Widget _buildMainContent() {
    return Row(
      children: [
        // 🔥 Side Container (Only on Tablet/Desktop)
        if (screenWidth > 800) _buildSideContainer(),

        // 🔥 Main Product List (Takes remaining space)
        Expanded(
          child: Stack(
            children: [
              Scrollbar(
                controller: _scrollController,
                child: _buildProductList(),
              ),
              _buildAnimatedHeader(),
            ],
          ),
        ),
      ],
    );
  }

  /// 🔥 Floating Header
  Widget _buildAnimatedHeader() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _offset < 100 ? 1 : 0,
      child: Container(
        color: Colors.black.withOpacity(0.8),
        width: double.infinity,
        height: screenHeight * 0.10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Terza Spiaggia',
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          _offset < 100 || _offset > 3000 ? const DownloadButton() : null,
      backgroundColor: Colors.black,
      body: _buildMainContent(),
    );
  }
}

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
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
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                  : const Icon(Icons.download, color: Colors.white),
            ),
            Text(
              downloadController.isLoading.value ? 'scaricando' : 'scarica',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ));
  }
}
