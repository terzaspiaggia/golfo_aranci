import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductModel extends Equatable {
  final String? id;
  final String number;
  final String title;
  final String description;
  final String imageUrl;
  late double price;
  final String allergens;

  ProductModel({
    this.id,
    required this.number,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.allergens,
  });

  static ProductModel fromJson(
    Map<String, dynamic> json, [
    String? id,
  ]) {
    final product = ProductModel(
      id: id ?? json['id'],
      number: json['number'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      allergens: json['allergens'],
    );
    return product;
  }

  @override
  List<Object?> get props {
    return [
      id,
      number,
      title,
      description,
      imageUrl,
      price,
      allergens,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'allergens': allergens,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Product { id: $id, number: $number, title: $title, description: $description, imageUrl: $imageUrl, price: $price, allergens: $allergens }';
  }
}
