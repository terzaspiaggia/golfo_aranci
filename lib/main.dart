import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:terza_spiaggia_web/router/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Terza Spiaggia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 900, name: TABLET),
            const Breakpoint(start: 901, end: double.infinity, name: DESKTOP),
          ],
        );
      },
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
