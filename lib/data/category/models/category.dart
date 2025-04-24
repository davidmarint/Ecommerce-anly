import 'dart:convert';

import 'package:ecommerce_anly/domain/category/entities/category.dart';

class CategoryModel {

  final String title;
  final String image;
  final String categoryId;

  CategoryModel({
    required this.title, 
    required this.image, 
    required this.categoryId
    });

     Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'categoryId': categoryId,
      'image': image,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'] ?? '',
      categoryId: map['categoryId']?.toString() ?? '',
      image: map['image'] ?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      image: image,
      title: title
    );
  }
}