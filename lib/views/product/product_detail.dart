import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as Product;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text(
          product.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
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
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  imageUrl: product.imageUrl ?? product.imageUrl,
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                      height: 300,
                      child: Text(
                        product.allergens,
                      )

                      // product.allergens != null
                      //     ? (product.allergens! as List<dynamic>).map((e) {
                      //         return Container(
                      //           margin: const EdgeInsets.all(5),
                      //           padding: const EdgeInsets.all(5),
                      //           decoration: BoxDecoration(
                      //             color: Colors.red,
                      //             borderRadius: BorderRadius.circular(5),
                      //           ),
                      //           child: Text(
                      //             '$e',
                      //             style: const TextStyle(
                      //               fontSize: 16,
                      //               color: Colors.white,
                      //             ),
                      //           ),
                      //         );
                      //       }).toList()
                      //     : const <Widget>[],
                      ),
                  //  ListView.builder(
                  //   itemCount: product.alergeni.length,
                  //   itemBuilder: (context, index) {
                  //     return Container(
                  //       margin: const EdgeInsets.all(5),
                  //       padding: const EdgeInsets.all(5),
                  //       decoration: BoxDecoration(
                  //         color: Colors.red,
                  //         borderRadius: BorderRadius.circular(5),
                  //       ),
                  //       child: Text(
                  //         '${product.alergeni[index]}',
                  //         style: const TextStyle(
                  //           fontSize: 16,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
