import 'package:get/get.dart';
import 'package:terza_spiaggia_web/constants.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';
import 'package:terza_spiaggia_web/views/home/home_page.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();

  final products = <ProductModel>[].obs;
  var categories = <String>[].obs;
  var selectedCategory = 'Tutti'.obs;
  var allProducts = <ProductModel>[].obs;
  var filteredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadProducts();
    _loadCategories();
  }

  Future<void> loadProductsAndNavigate() async {
   
    // Wait for the product stream to populate the products list
    await products.stream.firstWhere((productList) => productList.isNotEmpty);
    // Navigate to MyHomePage once products are loaded
  
    Get.offAll(() => const MyHomePage());
  }


  /// 🔥 Load All Products
  void _loadProducts() {
    dbService.getProduct().listen((productList) {
      allProducts.assignAll(productList);
      filteredProducts.assignAll(productList); // Show all by default
    });
  }

  /// 🔥 Load Categories from Firestore
  void _loadCategories() {
    dbService.getCategories().listen((categoryList) {
      categories.assignAll(categoryList);
    });
  }

  /// 🔥 Filter Products by Selected Category
  void filterProductsByCategory(String category) {
    selectedCategory.value = category;

    if (category == 'Tutti') {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(allProducts
          .where((product) => product.category == category)
          .toList());
    }
  }
}
