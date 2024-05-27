import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:terza_spiaggia_web/constants/images.dart';


class CarousselWidget extends StatelessWidget {
  final List<String> imagesList;
  const CarousselWidget({
    Key? key,
    required this.imagesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imagesList.length,
      options: CarouselOptions(
        autoPlayInterval: const Duration(seconds: 3),
        autoPlay: true,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
      itemBuilder: (context, index, realIndex) {
        return Container(
            decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage(
              PathImages.imagesList[index],
            ),
            fit: BoxFit.cover,
          ),
        ));
      },
    );
  }
}
