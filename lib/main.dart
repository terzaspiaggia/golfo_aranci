import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:terza_spiaggia_web/bindings/download_binding.dart';
import 'package:terza_spiaggia_web/bindings/product_binding.dart';
import 'package:terza_spiaggia_web/bindings/search_binding.dart';
import 'package:terza_spiaggia_web/firebase_options.dart';
import 'package:terza_spiaggia_web/router/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() {
    ProductBinding().dependencies();
    DownloadBinding().dependencies();
    SearchBinding().dependencies();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        fontFamily: 'OpenSans',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 72,
            color: Color(0xFFc5b357),
          ),
          displayMedium: TextStyle(
            fontSize: 48,
            color: Color(0xFFc5b357),
          ),
          displaySmall: TextStyle(
            fontSize: 36,
            color: Color(0xFFc5b357),
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            color: Color(0xFFc5b357),
          ),
          headlineSmall: TextStyle(
            fontSize: 18,
            color: Color(0xFFc5b357),
          ),
          titleLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFFc5b357),
          ),
          bodyLarge: TextStyle(
            fontSize: 14,
          ),
          bodyMedium: TextStyle(
            fontSize: 12,
          ),
        ),
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
