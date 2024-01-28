import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Scrollbar(
            child: ListView(
              shrinkWrap: true,
              cacheExtent: 2000,
              children: [
                SizedBox(height: height * 0.1),
                Container(
                  width: double.infinity,
                  height: height * 0.8,
                  color: Colors.blue,
                ),
                Container(
                  width: double.infinity,
                  height: height * 0.8,
                  color: Colors.green,
                ),
                Container(
                  width: double.infinity,
                  height: height * 0.8,
                  color: Colors.yellow,
                ),
                Container(
                  width: double.infinity,
                  height: height * 0.8,
                  color: Colors.purple,
                ),
                Container(
                  width: double.infinity,
                  height: height * 0.8,
                  color: Colors.orange,
                ),
                SizedBox(
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
                    'La Terza Spiaggia',
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
