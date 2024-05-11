import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terza_spiaggia_web/controllers/controllers_esports.dart';
import 'package:terza_spiaggia_web/controllers/product_controller.dart';

import 'package:terza_spiaggia_web/models/product_model.dart';

class SearchController extends GetxController {
  static SearchController get instance => Get.find();


  var searchList = <ProductModel>[].obs;

  TextEditingController searchTextController = TextEditingController();

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    searchList;
  }


  searchByNumber (){
    
  }


   

  // searchProductByEAN(String query) {
  //   List<ProductModel> result = <ProductModel>[];
  //   result.clear();
  //   if (query.isEmpty) {
  //     result = _products;
  //   } else {
  //     result = _products
  //         .where((ProductModel product) =>
  //             product.number
  //                 .replaceAll(' ', '')
  //                 .toLowerCase()
  //                 .contains(query.toLowerCase()) ||
  //             product.description
  //                 .trim()
  //                 .toLowerCase()
  //                 .contains(query.replaceAll(' ', '').toLowerCase()) ||
  //             product.title.trim().toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //     searchList.value = result;
  //     update();
  //   }
  }

