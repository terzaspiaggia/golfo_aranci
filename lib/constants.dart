import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:terza_spiaggia_web/services/database_service.dart';
// import 'package:terza_spiaggia_web/services/storage_service.dart';

final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseStorage storage = FirebaseStorage.instance;


  DatabaseService dbService = DatabaseService();
  // StorageService storage = StorageService();



Logger logger = Logger();


final kDefaultCardShadow = BoxShadow(
  offset: const Offset(0, 20),
  blurRadius: 50,
  color: Colors.black.withOpacity(0.1),
);

// TextField dedign
const kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

const kDefaultOutlineInputBorder = OutlineInputBorder(
  // Maybe flutter team need to fix it on web
  // borderRadius: BorderRadius.circular(50),
  borderSide: BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);