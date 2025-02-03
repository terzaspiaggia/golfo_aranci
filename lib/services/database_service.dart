// PRODUCTS

import 'package:terza_spiaggia_web/constants.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';

class DatabaseService {
  //  OLD METHOD - NOT USED ANYMORE
  // Stream<List<ProductModel>> getProduct() {
  //   return firebaseFirestore
  //       .collection('products')
  //       .where('isOnline', isEqualTo: true)
  //       .orderBy('number')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs
  //         .map((doc) => ProductModel.fromJson(
  //               doc.data(),
  //               doc.id,
  //             ))
  //         .toList();
  //   });
  // }

// NEW METHOD FOR FILTRING ONLINE PRODUCTS
  Stream<List<ProductModel>> getProduct() {
    return firebaseFirestore
        .collection('products')
        .orderBy('number')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data(), doc.id))
          .where((product) => product.isOnline == true) // ✅ Filter in Dart
          .toList();
      // ..sort((a, b) => a.number.compareTo(b.number)); // ✅ Sort in Dart
      //  can be used with sort method to sort the list
    });
  }

  Future<List<Map<String, dynamic>>> loadImagesFSFloorTrap() async {
    List<Map<String, dynamic>> files = [];

    final result =
        await firebaseFirestore.collection('products').doc('imageUrl').get();
    final List allFiles = result.data()!['imageUrl'];

    await Future.forEach(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      //final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        'url': fileUrl,
        'path': file.fullPath,
        //'Facility': fileMeta.customMetadata?['Facility'] ?? 'Nobody',
      });
    });

    return files;
  }
}
