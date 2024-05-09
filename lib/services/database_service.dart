// PRODUCTS

import 'package:terza_spiaggia_web/constants.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';

class DatabaseService {
  Stream<List<ProductModel>> getProduct() {
    return firebaseFirestore
        .collection('products')
        .orderBy('number')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ProductModel.fromJson(
                doc.data(),
                doc.id,
              ))
          .toList();
    });
  }


  Future<List<Map<String, dynamic>>> loadImagesFSFloorTrap() async {
    List<Map<String, dynamic>> files = [];

    final result = await firebaseFirestore
       
        .collection('products')
        .doc('imageUrl')
       .get();
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
