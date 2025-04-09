
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_anly/domain/product/entities/products.dart';

class ProductModel {

  final String categoryId;
  final Timestamp createdDate;
  final num discountedPrice;
  final int gender;
  final List < String > images;
  final num price;
  final List < String > sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductModel({
    required this.categoryId, 

    required this.createdDate, 
    required this.discountedPrice, 
    required this.gender, 
    required this.images, 
    required this.price, 
    required this.sizes, 
    required this.productId, 
    required this.salesNumber, 
    required this.title});

      factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map['categoryId'] ?? '',
      createdDate: map['createdDate'] != null
          ? map['createdDate'] as Timestamp
          : Timestamp.now(), // Evita el error de null
      discountedPrice: map['discountedPrice'] ?? 0,
      gender: map['gender'] ?? 0,
      images: map['images'] is List
          ? List<String>.from(map['images'].map((e) => e.toString()))
          : [],
      price: map['price'] ?? 0,
      sizes: map['sizes'] is List
          ? List<String>.from(map['sizes'].map((e) => e.toString()))
          : [],
      productId: map['productId'] ?? '',
      salesNumber: map['salesNumber'] ?? 0,
      title: map['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'createdDate': createdDate,
      'discountedPrice': discountedPrice,
      'gender': gender,
      'images': images.map((e) => e.toString()).toList(),
      'price': price,
      'sizes': sizes.map((e) => e.toString()).toList(),
      'productId': productId,
      'salesNumber': salesNumber,
      'title': title,
    };
  }

}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images, 
      price: price,
      sizes: sizes, 
      productId: productId, 
      salesNumber: salesNumber, 
      title: title
    );
  }
}

extension ProductXEntity on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(
      categoryId: categoryId,
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images, 
      price: price,
      sizes: sizes, 
      productId: productId, 
      salesNumber: salesNumber, 
      title: title
    );
  }
}