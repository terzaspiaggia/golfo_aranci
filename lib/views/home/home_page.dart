import 'package:flutter/material.dart';
import 'package:terza_spiaggia_web/constants/dynalic_values.dart';
import 'package:terza_spiaggia_web/views/widgets/container_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 600;
    return Scaffold(
      body: Stack(
        children: [
          Scrollbar(
            child: ListView(
              shrinkWrap: true,
              cacheExtent: 2000,
              children: [
                const SizedBox(height: height * 0.1),
                SizedBox(
                  width: height,
                  child: ContainerWidget(
                    height: height,
                    image: const NetworkImage(
                        'https://picsum.photos/id/28/${height * 3}/${height * 1.5}'),
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies aliquam, nunc nisl ultricies nisi, vitae ultricies nisl nisl eget nunc. Donec auctor, nisl eget ultricies aliquam, nunc nisl ultricies nisi, vitae ultricies nisl nisl eget nunc.',
                    title: 'Terza Spiaggia',
                    padding: 20,
                    left: responsiveValue(
                      context,
                      defaultVal: 0,
                      mobileVal: 0,
                      tabletVal: height * 0.1,
                      desktopVal: height - (height / 1.66),
                    ),
                    right: responsiveValue(
                      context,
                      defaultVal: height * 0.1,
                      mobileVal: 10,
                      tabletVal: height * 0.1,
                      desktopVal: height - (height / 1.66),
                    ),
                    bottom: responsiveValue(
                      context,
                      defaultVal: height * 0.1,
                      mobileVal: 10,
                      tabletVal: height * 0.2,
                      desktopVal: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: height,
                  child: ContainerWidget(
                    height: height,
                    image: const NetworkImage(
                        'https://picsum.photos/id/29/${height * 3}/${height * 1.5}'),
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies aliquam, nunc nisl ultricies nisi, vitae ultricies nisl nisl eget nunc. Donec auctor, nisl eget ultricies aliquam, nunc nisl ultricies nisi, vitae ultricies nisl nisl eget nunc.',
                    title: 'Terza Spiaggia',
                    padding: 20,
                    left: responsiveValue(
                      context,
                      defaultVal: 0,
                      mobileVal: 0,
                      tabletVal: height * 0.1,
                      desktopVal: height - (height / 1.66),
                    ),
                    right: responsiveValue(
                      context,
                      defaultVal: height * 0.1,
                      mobileVal: 10,
                      tabletVal: height * 0.1,
                      desktopVal: height - (height / 1.66),
                    ),
                    bottom: responsiveValue(
                      context,
                      defaultVal: height * 0.1,
                      mobileVal: 10,
                      tabletVal: height * 0.2,
                      desktopVal: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: height,
                  child: ContainerWidget(
                    height: height,
                    image: const NetworkImage(
                        'https://picsum.photos/id/30/${height * 3}/${height * 1.5}'),
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies aliquam, nunc nisl ultricies nisi, vitae ultricies nisl nisl eget nunc. Donec auctor, nisl eget ultricies aliquam, nunc nisl ultricies nisi, vitae ultricies nisl nisl eget nunc.',
                    title: 'Terza Spiaggia',
                    padding: 20,
                    left: responsiveValue(
                      context,
                      defaultVal: 0,
                      mobileVal: 0,
                      tabletVal: height * 0.1,
                      desktopVal: height - (height / 1.66),
                    ),
                    right: responsiveValue(
                      context,
                      defaultVal: height * 0.1,
                      mobileVal: 10,
                      tabletVal: height * 0.1,
                      desktopVal: height - (height / 1.66),
                    ),
                    bottom: responsiveValue(
                      context,
                      defaultVal: height * 0.1,
                      mobileVal: 10,
                      tabletVal: height * 0.2,
                      desktopVal: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: height,
                  child: ContainerWidget(
                    height: height,
                    image: const NetworkImage(
                        'https://picsum.photos/id/31/${height * 3}/${height * 1.5}'),
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies aliquam, nunc nisl ultricies nisi, vitae ultricies nisl nisl eget nunc. Donec auctor, nisl eget ultricies aliquam, nunc nisl ultricies nisi, vitae ultricies nisl nisl eget nunc.',
                    title: 'Terza Spiaggia',
                    padding: 20,
                    left: responsiveValue(
                      context,
                      defaultVal: 0,
                      mobileVal: 0,
                      tabletVal: height * 0.1,
                      desktopVal: height - (height / 1.66),
                    ),
                    right: responsiveValue(
                      context,
                      defaultVal: height * 0.1,
                      mobileVal: 10,
                      tabletVal: height * 0.1,
                      desktopVal: height - (height / 1.66),
                    ),
                    bottom: responsiveValue(
                      context,
                      defaultVal: height * 0.1,
                      mobileVal: 10,
                      tabletVal: height * 0.2,
                      desktopVal: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: height,
                  child: ContainerWidget(
                    height: height,
                    image: const NetworkImage(
                        'https://picsum.photos/id/32/${height * 3}/${height * 1.5}'),
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies aliquam, nunc nisl ultricies nisi, vitae ultricies nisl nisl eget nunc. Donec auctor, nisl eget ultricies aliquam, nunc nisl ultricies nisi, vitae ultricies nisl nisl eget nunc.',
                    title: 'Terza Spiaggia',
                    padding: 20,
                    left: responsiveValue(
                      context,
                      defaultVal: 0,
                      mobileVal: 0,
                      tabletVal: height * 0.1,
                      desktopVal: height - (height / 1.66),
                    ),
                    right: responsiveValue(
                      context,
                      defaultVal: height * 0.1,
                      mobileVal: 10,
                      tabletVal: height * 0.1,
                      desktopVal: height - (height / 1.66),
                    ),
                    bottom: responsiveValue(
                      context,
                      defaultVal: height * 0.1,
                      mobileVal: 10,
                      tabletVal: height * 0.2,
                      desktopVal: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: height * 0.2,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: height * 0.1,
              color: Colors.white.withOpacity(0.7),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Business Name',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
