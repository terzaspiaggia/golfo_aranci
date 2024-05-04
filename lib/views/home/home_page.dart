import 'package:flutter/material.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terza Spiaggia sushi menu'),
      ),
      body: Stack(
        children: [
          Container(
            height: height,
            width: double.infinity,
            color: Colors.black,
          ),
          Scrollbar(
            controller: _scrollController,
            child: ListView.builder(
              shrinkWrap: true,
              controller: _scrollController,
              itemCount: Product.products.length,
              itemBuilder: (context, index) {
                final Product product = Product.products[index];
                return ProductWidget(
                  height: height,
                  product: product,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.height,
    required this.product,
  });

  final double height;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: height * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(product.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        // margin: const EdgeInsets.fromLTRB(30, 20, 50, 10),
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
        width: 400,
        height: height * 0.26,
        child: Stack(
          children: [
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        product.id,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Bodoni_Moda',
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        product.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Bodoni_Moda',
                        ),
                      ),
                    ],
                  ),
                  Text(
                    product.price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bodoni_Moda',
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 110,
              left: 0,
              bottom: 0,
              child: SizedBox(
                width: 300,
                child: Text(
                  product.description,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Bodoni_Moda',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
