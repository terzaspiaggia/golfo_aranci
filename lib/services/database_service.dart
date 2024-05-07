
  // PRODUCTS



  import 'package:terza_spiaggia_web/constants.dart';
import 'package:terza_spiaggia_web/models/product_model.dart';

class DatabaseService {


Stream<List<Product>> getProduct() {
    return firebaseFirestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Product.fromJson(
                doc.data(),
                doc.id,
              ))
          .toList();
    });
  }

  // Future<void> addProduct(Product product) {
  //   return firebaseFirestore.collection('products').add(
  //         product.toMap(),
  //       );
  // }

  // Future<void> removeProduct(Product product) {
  //   return firebaseFirestore.collection('products').doc(product.id).delete();
  // }

  // Future<void> updateField(
  //   Product product,
  //   String field,
  //   dynamic newValue,
  // ) {
  //   return firebaseFirestore
  //       .collection('products')
  //       .doc(product.id)
  //       .update({field: newValue});
  // }

  }

//   // ORDDERS
//   Future<void> updateOrder(
//     Orders orders,
//     String field,
//     dynamic newValue,
//   ) {
//     return firebaseFirestore
//         .collection('checkout')
//         .doc(orders.id)
//         // .where('id', isEqualTo: orders.id)
//         .get()
//         .then((querySnapshot) =>
//             querySnapshot.reference.update({field: newValue}));
//   }

//   Stream<List<Orders>> getOrders() {
//     return firebaseFirestore.collection('checkout').snapshots().map((snapshot) {
//       return snapshot.docs
//           .map((doc) => Orders.fromJson(
//                 doc.data(),
//                 doc.id,
//               ))
//           .toList();
//     });
//   }

// //  PENDING ORDERS
//   Stream<List<Orders>> getPendingOrders() {
//     return firebaseFirestore
//         .collection('checkout')
//         .where('isCancelled', isEqualTo: false)
//         .where('isDelivered', isEqualTo: false)
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs
//           .map((doc) => Orders.fromJson(doc.data(), doc.id))
//           .toList();
//     });
//   }

//   //ORDERS STATS
//   Future<List<OrderStats>> getOrderStats() {
//     return firebaseFirestore
//         .collection('checkout')
//         .orderBy('dateTime')
//         .get()
//         .then((querySnapshot) => querySnapshot.docs
//             .asMap()
//             .entries
//             .map((entry) => OrderStats.fromSnapshot(entry.value, entry.key))
//             .toList());
//   }

// // CATEGORIES

//   Stream<List<Category>> getCategories() {
//     return firebaseFirestore
//         .collection('categories')
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
//     });
//   }

//   Future<void> addCategory(Category category) {
//     return firebaseFirestore.collection('categories').add(
//           category.toMap(),
//         );
//   }



//   Future<void> removeCategory(Category category) {

//     return firebaseFirestore.collection('categories').doc(category.id).delete();
//   }

//   // USERS

//   Stream<List<User>> getUser() {
//     return firebaseFirestore.collection('users').snapshots().map((snapshot) {
//       return snapshot.docs
//           .map((doc) => User.fromJson(
//                 doc.data(),
//                 doc.id,
//               ))
//           .toList();
//     });
//   }

//   Future<void> removeClient(User user) {
//     return firebaseFirestore.collection('users').doc(user.id).delete();
//   }

