import 'package:get/get.dart';
import 'package:terza_spiaggia_web/controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchControler>(() => SearchControler());
  }
}
