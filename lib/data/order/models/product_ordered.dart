import 'package:ecommerce_anly/domain/order/entities/product_ordered.dart';

class ProductOrderedModel {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final double productPrice;
  final double totalPrice;
  final String productImageUrl;
  final String createdDate;

  ProductOrderedModel({
    required this.productId, 
    required this.productTitle, 
    required this.productQuantity,
    required this.productPrice,
    required this.totalPrice,
    required this.productImageUrl,
    required this.createdDate,
    });

    factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderedModel(
      productId: map['productId'] ?? '',
      productTitle: map['productTitle'] ?? '',
      productQuantity: map['productQuantity'] as int ?? 0,
      productPrice: map['productPrice'] as double   ?? 0.0,
      totalPrice: map['totalPrice'] as double ?? 0.0,
      productImageUrl: map['productImageUrl']  ?.toString() ?? '',
      createdDate: map['createdDate'] ?? '',
      //id: map['id'] as String,
    );
  }
}

extension ProductOrderedModelX on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity (
      productId: productId,
      productTitle: productTitle,
      productQuantity: productQuantity,
      productPrice: productPrice,
      totalPrice: totalPrice,
      productImageUrl: productImageUrl,
      createdDate: createdDate,
    );
  }
}
