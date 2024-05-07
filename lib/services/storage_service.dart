import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:terza_spiaggia_web/constants.dart';


class StorageService {
  Future<void> uploadImage(XFile image) async {
    try {
      await storage
          .ref('product_images/${image.name}')
          .putFile(File(image.path));
    } catch (e) {
      logger.i(e);
    }
  }

  Future<String> getImageURL(String imageName) async {
    String downloadURL =
        await storage.ref('product_images/$imageName').getDownloadURL();
    return downloadURL;
  }
}
