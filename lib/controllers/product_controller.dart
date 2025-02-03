import 'package:get/get.dart';
import 'package:terza_spiaggia_web/constants.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';
import 'package:terza_spiaggia_web/views/home/home_page.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();

  final products = <ProductModel>[].obs;


  @override
  void onInit() {
    super.onInit();
    products.bindStream(dbService.getProduct());
  }

  Future<void> loadProductsAndNavigate() async {
   
    // Wait for the product stream to populate the products list
    await products.stream.firstWhere((productList) => productList.isNotEmpty);
    // Navigate to MyHomePage once products are loaded
  
    Get.offAll(() => const MyHomePage());
  }
}
