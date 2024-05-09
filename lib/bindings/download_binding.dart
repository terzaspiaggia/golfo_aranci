import 'package:get/get.dart';
import 'package:terza_spiaggia_web/controllers/download_controller.dart';

class DownloadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DownloadController>(() => DownloadController());
  }
}