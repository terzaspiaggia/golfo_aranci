import 'package:get/get.dart';
import 'package:terza_spiaggia_web/views/home/home_page.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const MyHomePage(),
    ),
    GetPage(
      name: _Paths.product,
      page: () => const MyHomePage(),
    ),
  ];
}

abstract class Routes {
  static const home = _Paths.home;
  static const product = _Paths.product;

  Routes._();
}

abstract class _Paths {
  _Paths._();

  static const home = '/login';
  static const product = '/product';
}
