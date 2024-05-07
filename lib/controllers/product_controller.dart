import 'package:get/get.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';
import 'package:terza_spiaggia_web/services/database_service.dart';
import 'package:terza_spiaggia_web/services/storage_service.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  final RxList products = <Product>[].obs;

  DatabaseService database = DatabaseService();
  StorageService storage = StorageService();

  @override
  void onInit() {
    super.onInit();
    products.bindStream(database.getProduct());
  }
}
