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
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.height * 0.4,
                child: product.imageUrl.isEmpty
                    ? Center(child: Image.asset('assets/images/abreve.jpeg'))
                    : CachedNetworkImage(
                        imageUrl: product.imageUrl,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                  mobileVal: 100,
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
                      textAlign: TextAlign.center,
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
                    'ALLERGENI: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    width: responsiveValue(
                      context,
                      defaultVal: 500,
                      mobileVal: 300,
                      tabletVal: 500,
                      desktopVal: 500,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        'Informiamo la gentile clientela che il pesce destinato ad essere consumato crudo o praticamente crudo è stato sottoposto a trattamento di bonifica preventiva conforme alle prescrizioni del Regolamento CE 853/2004, allegato III, sezione VIII, capitolo 3, lettera D, punto 3.',
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                        textAlign: TextAlign.center,
                      ),
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
