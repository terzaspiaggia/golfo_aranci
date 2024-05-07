// PRODUCTS

import 'package:terza_spiaggia_web/constants.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';

class DatabaseService {
  Stream<List<Product>> getProduct() {
    return firebaseFirestore
        .collection('products')
        .orderBy(
            'number') // Add orderBy clause to order by the 'number' parameter
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Product.fromJson(
                doc.data(),
                doc.id,
              ))
          .toList();
    });
  }
}
