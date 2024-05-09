import 'package:get/get.dart';
import 'package:terza_spiaggia_web/constants.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  final RxList products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    products.bindStream(dbService.getProduct());
  }
}
