import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terza_spiaggia_web/constants/dynalic_values.dart';
import 'package:terza_spiaggia_web/controllers/product_controller.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';

class ProductDetails extends GetView<ProductController> {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          product.title,
          style: TextStyle(
            color: Colors.grey[400],
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.grey[400],
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   alignment: Alignment.center,
              //   width: double.infinity,
              //   height: 100,
              //   padding: const EdgeInsets.all(10),
              //   decoration: const BoxDecoration(),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           IconButton(
              //             onPressed: () => Get.back(),
              //             icon: const Icon(
              //               Icons.arrow_back,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ],
              //       ),
              //       Text(
              //         product.title,
              //         style: const TextStyle(
              //           fontSize: 30,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
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
                width: responsiveValue(
                  context,
                  defaultVal: 500,
                  mobileVal: 300,
                  tabletVal: 500,
                  desktopVal: 500,
                ),
                height: responsiveValue(
                  context,
                  defaultVal: 500,
                  mobileVal: 80,
                  tabletVal: 90,
                  desktopVal: 100,
                ),
                child: Column(
                  children: [
                    Text(
                      'INGREDIENTI :',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[400],
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
                  Text(
                    'ALERGENI: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              child: Text(
                                e,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              )),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    width: responsiveValue(
                      context,
                      defaultVal: 500,
                      mobileVal: 300,
                      tabletVal: 500,
                      desktopVal: 500,
                    ),
                    child: Text(
                      'Informiamo la gentile clientela che il pesce destinato ad essere consumato crudo o praticamente crudo è stato sottoposto a trattamento di bonifica preventiva conforme alle prescrizioni del Regolamento CE 853/2004, allegato III, sezione VIII, capitolo 3, lettera D, punto 3.',
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                      textAlign: TextAlign.center,
                    ),
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
