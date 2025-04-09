import 'dart:convert';

import 'package:ecommerce_anly/domain/product/entities/color.dart';

class ProductColorModel{
  final String name;
  final String hexCode;

  ProductColorModel({
    required this.name,
    required this.hexCode,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'hexCode': hexCode,
    };
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      name: map['title'] as String,
      hexCode: map['title'] as String,
      // List < int > .from(
      //   map['hexCode'].map((e) => e),
      //),
    );
  }

}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      name: name,
      hexCode: hexCode
    );
  }
}

extension ProductColorXEntity on ProductColorEntity {
  ProductColorModel fromEntity() {
    return ProductColorModel(
      name: name,
      hexCode: hexCode
    );
  }

}