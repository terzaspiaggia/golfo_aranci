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
        defaultVal: 14, mobileVal: 12, tabletVal: 16, desktopVal: 18);
  }

  titleTextHeiht(BuildContext context) {
    return responsiveValue(context,
        defaultVal: 20, mobileVal: 14, tabletVal: 20, desktopVal: 22);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      constraints: BoxConstraints(
        maxWidth: responsiveValue(
          context,
          defaultVal: 100,
          mobileVal: 50,
          tabletVal: 80,
          desktopVal: 100,
        ),
      ),
      duration: const Duration(microseconds: 2000),
      curve: Curves.easeIn,
      height: responsiveValue(
        context,
        defaultVal: 200,
        mobileVal: 160,
        tabletVal: 215,
        desktopVal: 260,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: responsiveValue(
          context,
          defaultVal: 20,
          mobileVal: 5,
          tabletVal: 20,
          desktopVal: 280,
        ),
        vertical: responsiveValue(
          context,
          defaultVal: 10,
          mobileVal: 0,
          tabletVal: 10,
          desktopVal: 10,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: responsiveValue(
                  context,
                  defaultVal: 200,
                  mobileVal: 80,
                  tabletVal: 115,
                  desktopVal: 160,
                ),
                width: responsiveValue(
                  context,
                  defaultVal: 200,
                  mobileVal: 80,
                  tabletVal: 115,
                  desktopVal: 160,
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              ElevatedButton(
                onPressed: () =>
                    Get.to(() => const ProductDetails(), arguments: product),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.transparent,
                  ),
                  side: WidgetStateProperty.all(BorderSide(
                    color: Colors.grey[400]!,
                    width: 1,
                  )),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                ),
                child:
                    Text('DETAGLIO', style: TextStyle(color: Colors.grey[400])),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      Text(
                        product.number,
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: titleTextHeiht(context),
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.clip),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        product.title,
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: titleTextHeiht(context),
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.clip),
                      ),
                    ],
                  ),
                  Text(
                    '€ ${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: titleTextHeiht(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 1,
                height: 5,
              ),
              Text(
                product.description,
                maxLines: 3,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: descriptionTextHeight(context),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () => Get.to(() => const ProductDetails(),
              //           arguments: product),
              //       style: ButtonStyle(
              //         backgroundColor:
              //             WidgetStateProperty.all(Colors.grey[400]),
              //         shape: WidgetStateProperty.all(RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10),
              //         )),
              //       ),
              //       child: const Text('DETAGLIO'),
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}



//  CachedNetworkImage(
//               imageUrl: (product.imageUrl),
//               imageBuilder: (context, imageProvider) => Container(
//                     height: responsiveValue(
//                       context,
//                       defaultVal: 100,
//                       mobileVal: 40,
//                       tabletVal: 70,
//                       desktopVal: 100,
//                     ),
//                     width: responsiveValue(
//                       context,
//                       defaultVal: 100,
//                       mobileVal: 40,
//                       tabletVal: 70,
//                       desktopVal: 100,
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       image: DecorationImage(
//                         image: imageProvider,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//               placeholder: (context, url) =>
//                   const Center(child: CircularProgressIndicator()),
//               errorWidget: (context, url, error) => const SizedBox.shrink()
//               // Image.asset("PathToImage"),
//               ),