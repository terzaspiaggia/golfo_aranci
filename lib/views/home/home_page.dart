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
  double _offset = 0;

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
    setState(() {
      _offset = _scrollController.offset;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// 🔥 Responsive Side Container (Only for Desktop & Tablets)
  Widget _buildSideContainer() {
    if (screenWidth < 800) return const SizedBox(); // Hide on mobile
    return Obx(
      () => Container(
        width: 250,
        height: screenHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
          ),
          color: Colors.grey[900],
        ),
        padding: EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(50),
              ),
              color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Categorie",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    _categoryTile("Tutti", Icons.grid_view),
                    const Divider(color: Colors.grey),
                    ...productController.categories
                        .toSet()
                        .toList(growable: false)
                        .map((category) =>
                            _categoryTile(category, Icons.category)),
                    SideButton(
                        onPressed: () {
                          Get.to(() => const MarketingSite());
                        },
                        text: "il nostro sito")
                  ],
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: TextButton(
                    onPressed: () {
                      downloadController.generatePdfAndDownload();
                    },
                    child: Text(
                      "MENU PDF",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 Category Tile (Reusable)
  Widget _categoryTile(String category, IconData icon) {
    String getFirstProductImage(String category) {
      // Find the first product that matches the category
      final product = productController.allProducts.firstWhere(
        (p) => p.category == category,
      );

      return product.imageUrl;
    }

    final isSelected = productController.selectedCategory.value == category;
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[800]!, width: 1),
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: category == "Tutti"
                ? null
                : DecorationImage(
                    image: NetworkImage(getFirstProductImage(category)),
                    fit: BoxFit.contain,
                  ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  // color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  leading: Icon(
                    icon,
                    color: Colors.white,
                  ),
                  trailing: isSelected
                      ? const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : null,
                  tileColor: isSelected ? Colors.grey[800] : null,
                  onTap: () {
                    productController.filterProductsByCategory(category);
                    if (screenWidth < 800) Get.back();
                  },
                ),
              ),
            ],
          )),
    );
  }

  /// 🔥 Product Grid
  Widget _buildProductList() {
    return Obx(() {
      final products = productController.filteredProducts.toList();
      if (products.isEmpty) {
        return const Center(
            child: Text("No products found",
                style: TextStyle(color: Colors.white)));
      }

      return Column(
        children: [
          Expanded(
            child: MasonryGridView.count(
              controller: _scrollController,
              crossAxisCount: screenWidth > 1200
                  ? 4
                  : screenWidth > 900
                      ? 3
                      : 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              itemCount: products.length,
              itemBuilder: (context, index) => AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: 1,
                child: ProductWidget(
                    height: screenHeight, product: products[index]),
              ),
            ),
          ),
          // _buildFooter(), // ✅ Keep Footer Always at the Bottom
        ],
      );
    });
  }

  /// 🔥 Footer
  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () => Get.to(() => const MarketingSite()),
        child: Container(
          padding: const EdgeInsets.all(10),
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
    );
  }

  /// 🔥 Layout with Side Container (Hides on Mobile)
  Widget _buildMainContent() {
    return Row(
      children: [
        if (screenWidth > 800) _buildSideContainer(),
        Expanded(child: _buildProductList()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Terza Spiaggia",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          actions: [
            if (screenWidth < 800)
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: _showBottomSheet,
              ),
          ],
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.black,
        body: _buildMainContent());
    //   floatingActionButton:
    //       _offset < 100 || _offset > 900 ? const DownloadButton() : null,
    // );
  }

  /// 🔥 Bottom Sheet for Mobile Navigation
  void _showBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 300,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Categorie",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Expanded(
              child: ListView(
                children: [
                  _categoryTile("Tutti", Icons.grid_view),
                  const Divider(color: Colors.grey),
                  ...productController.categories
                      .toSet()
                      .toList(growable: false)
                      .map((category) =>
                          _categoryTile(category, Icons.category)),
                ],
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}

class SideButton extends StatelessWidget {
  const SideButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[800]!, width: 1),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () => Future.delayed(const Duration(seconds: 3),
            downloadController.generatePdfAndDownload),
        child: Text(
          downloadController.isLoading.value ? 'scaricando' : 'scarica il menu',
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
