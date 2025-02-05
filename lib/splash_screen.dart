import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:terza_spiaggia_web/controllers/product_controller.dart';
import 'package:terza_spiaggia_web/views/home/home_page.dart';

class MySplashSreen extends StatelessWidget {
  MySplashSreen({super.key});

  // Get the instance of ProductController
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    productController.filteredProducts();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              displayFullTextOnTap: true,
              animatedTexts: [
                TyperAnimatedText(
                  speed: const Duration(milliseconds: 100),
                  'Terza Spiaggia',
                  textStyle: const TextStyle(
                    fontSize: 72,
                    color: Color(0xFFc5b357),
                  ),
                ),
                TyperAnimatedText(
                  speed: const Duration(milliseconds: 100),
                  'Restaurant',
                  textStyle: const TextStyle(
                    fontSize: 72,
                    color: Color(0xFFc5b357),
                  ),
                ),
              ],
            ),
            const Text('Loading...', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            LoadingAnimationWidget.discreteCircle(
              color: const Color(0xFFFF0000),
              secondRingColor: const Color(0xFFFFDD03),
              thirdRingColor: const Color(0xC5006DDB),
              size: 100,
            ),
          ],
        ),

        // Lottie.asset(
        //   'assets/animations/Animation - 1716910668576.json',
        // ),
      ),
    );
  }
}
