import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terza_spiaggia_web/controllers/product_controller.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';

class ProductDetails extends GetView<ProductController> {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as Product;
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   iconTheme: const IconThemeData(
      //     color: Colors.white, //change your color here
      //   ), // 1

      //   backgroundColor: Colors.black,
      //   title: Text(
      //     product.title,
      //     style: const TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.height * 0.5,
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    const Text(
                      'INGREDIENTI :',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'ALERGENI: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 150,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: product.allergens
                            .split(',')
                            .map(
                              (e) => Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(e)),
                            )
                            .toList()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
