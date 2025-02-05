import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terza_spiaggia_web/controllers/product_controller.dart';

import 'package:terza_spiaggia_web/models/product_model.dart';

class SearchControler extends GetxController {
  static SearchControler get instance => Get.find();

  var searchList = <ProductModel>[].obs;
  final products = Get.find<ProductController>().products;
  TextEditingController sercheTextEditing = TextEditingController();

  @override
  void onClose() {
    sercheTextEditing.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    searchList.value = products;
  }

  void searchByNumber() {
    if (sercheTextEditing.text.isEmpty) {
      // Reset to the full list or handle as needed
      searchList.value = []; // Or set it to the full list if you have it stored
    } else {
      var searchText = sercheTextEditing.text
          // .replaceAll(' ', '').
          .toLowerCase();
      var result = searchList.where((ProductModel product) {
        var productNumber = product.number.toLowerCase();
        var productTitle = product.title.trim().toLowerCase();
        return productNumber.contains(searchText) ||
            productTitle.contains(searchText);
      }).toList();
      searchList.value = result;

      update();
    }
    update();
  }


  void clearSearch() {
    sercheTextEditing.clear();
    searchList.value = products;
    update();
  }
}
