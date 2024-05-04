import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';

class ProductController extends GetxController {
  final RxList products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() {
    products.value = Product.products;
  }
}
