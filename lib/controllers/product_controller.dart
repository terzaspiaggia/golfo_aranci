import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';
import 'package:terza_spiaggia_web/services/database_service.dart';
import 'package:terza_spiaggia_web/services/storage_service.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  final RxList products = <Product>[].obs;

  DatabaseService database = DatabaseService();
  StorageService storage = StorageService();

  RxBool isLoading = false.obs;
  RxString? erroMessage;
  late String? imageUrl;

  @override
  void onInit() {
    super.onInit();
    products.bindStream(database.getProduct());
    loadImage();
  }

  Future<void> loadImage() async {
    try {
      imageUrl = await _getImageURL();
    } catch (error) {
      erroMessage = error.toString().obs;
    }
  }

  Future<String> _getImageURL() async {
    var ref = storage.getImageURL('product_images');
    return ref;
  }

  Widget build(BuildContext context) {
    if (isLoading.value) {
      return const CircularProgressIndicator();
    } else if (erroMessage != null) {
      return Text(erroMessage!.toString());
    } else {
      return Image.network(imageUrl!);
    }
  }
}
