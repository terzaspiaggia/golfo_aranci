import 'package:get/get.dart';
import 'package:terza_spiaggia_web/views/home/home_page.dart';
import 'package:terza_spiaggia_web/views/marketing/site_marketing.dart';
import 'package:terza_spiaggia_web/views/product/product_detail.dart';

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
      page: () => const ProductDetails(),
    ),
    GetPage(
      name: _Paths.marketting,
      page: () => const MarketingSite(),
    ),
  ];
}

abstract class Routes {
  static const home = _Paths.home;
  static const product = _Paths.product;
  static const marketting = _Paths.marketting;

  Routes._();
}

abstract class _Paths {
  _Paths._();

  static const home = '/';
  static const product = '/product';
  static const marketting = '/marketing';
}
