import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/web.dart';
import 'package:terza_spiaggia_web/services/database_service.dart';
// import 'package:terza_spiaggia_web/services/storage_service.dart';

final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseStorage storage = FirebaseStorage.instance;


  DatabaseService dbService = DatabaseService();
  // StorageService storage = StorageService();



Logger logger = Logger();
