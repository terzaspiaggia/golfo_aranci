import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:terza_spiaggia_web/controllers/product_controller.dart';
import 'package:terza_spiaggia_web/views/home/home_page.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    _startLoading(); // ✅ Start loading products on splash screen
  }

  /// **🔥 Load Products & Navigate to Home**
  Future<void> _startLoading() async {
    try {
      // await productController.loadProductsAndNavigate();
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(() => const MyHomePage()); // ✅ Navigate to Home
      });
    } catch (e) {
      print("Error loading products: $e");
      Get.snackbar("Errore", "Non è stato possibile caricare i prodotti!",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 600, // ✅ Prevents infinite width
            maxHeight: 600, // ✅ Prevents infinite height
          ),
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
                      fontSize: 50,
                      color: Color(0xFFc5b357),
                    ),
                  ),
                  TyperAnimatedText(
                    speed: const Duration(milliseconds: 100),
                    'Restaurant',
                    textStyle: const TextStyle(
                      fontSize: 50,
                      color: Color(0xFFc5b357),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
        ),
      ),
    );
  }
}
