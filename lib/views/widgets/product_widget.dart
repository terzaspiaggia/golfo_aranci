import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terza_spiaggia_web/constants/dynalic_values.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';
import 'package:terza_spiaggia_web/views/product/product_detail.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.height,
    required this.product,
  });

  final double height;
  final ProductModel product;

  descriptionTextHeight(
    BuildContext context,
  ) {
    return responsiveValue(context,
        defaultVal: 14, mobileVal: 10, tabletVal: 12, desktopVal: 18);
  }

  titleTextHeiht(BuildContext context) {
    return responsiveValue(context,
        defaultVal: 20, mobileVal: 10, tabletVal: 16, desktopVal: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      borderOnForeground: true,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    product.number,
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: titleTextHeiht(context),
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.clip),
                  ),
                ),
                SizedBox(
                  height: responsiveValue(
                    context,
                    defaultVal: 200,
                    mobileVal: 40,
                    tabletVal: 80,
                    desktopVal: 70,
                  ),
                  width: responsiveValue(
                    context,
                    defaultVal: 200,
                    mobileVal: 40,
                    tabletVal: 80,
                    desktopVal: 70,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    fadeInDuration: const Duration(milliseconds: 500),
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey[500],
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ],
            ),
            Text(
              product.title,
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: titleTextHeiht(context),
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.clip),
            ),
            // Text(
            //   product.description,
            //   maxLines: 5,
            //   textAlign: TextAlign.start,
            //   overflow: TextOverflow.ellipsis,
            //   style: TextStyle(
            //     color: Colors.grey[400],
            //     fontSize: descriptionTextHeight(context),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '€ ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: titleTextHeiht(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ButtonDetails(product: product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonDetails extends StatelessWidget {
  const ButtonDetails({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () =>
            Get.to(() => const ProductDetails(), arguments: product),
        child: Text('allergeni'));

    // ElevatedButton(
    //   onPressed: () => Get.to(() => const ProductDetails(), arguments: product),
    //   style: ButtonStyle(
    //     backgroundColor: WidgetStateProperty.all(
    //       Colors.transparent,
    //     ),
    //     side: WidgetStateProperty.all(BorderSide(
    //       color: Colors.grey[400]!,
    //       width: 1,
    //     )),
    //     shape: WidgetStateProperty.all(RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     )),
    //   ),
    //   child: Text('DI PIU', style: TextStyle(color: Colors.grey[400])),
    // );
  }
}
