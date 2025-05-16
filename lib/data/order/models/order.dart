import 'package:ecommerce_anly/data/order/models/order_status.dart';
import 'package:ecommerce_anly/data/order/models/product_ordered.dart';
import 'package:ecommerce_anly/domain/order/entities/order.dart';

class OrderModel{
  final List<ProductOrderedModel> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String code;
  final List<OrderStatusModel> orderStatus;

  OrderModel({
    required this.products, 
    required this.createdDate, 
    required this.shippingAddress, 
    required this.itemCount, 
    required this.totalPrice,
    required this.code,
    required this.orderStatus
    });


 factory OrderModel.fromMap(Map<String, dynamic> map) {
  return OrderModel(
    products: map['products'] != null
        ? List<ProductOrderedModel>.from(
            (map['products'] as List).map((e) => ProductOrderedModel.fromMap(e)))
        : [],
    createdDate: map['createdDate'] ?? '',
    shippingAddress: map['shippingAddress'] ?? '',
    itemCount: map['itemCount'] ?? 0,
    totalPrice: (map['totalPrice'] ?? 0).toDouble(),
    code: map['code'] ?? '',
    orderStatus: map['orderStatus'] != null
        ? List<OrderStatusModel>.from(
            (map['orderStatus'] as List).map((e) => OrderStatusModel.fromMap(e)))
        : [],
  );
}

}

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      products: products.map((e) => e.toEntity()).toList(), 
      createdDate: createdDate, 
      shippingAddress: shippingAddress, 
      itemCount: itemCount, 
      totalPrice: totalPrice, 
      code: code,
      orderStatus: orderStatus.map((e) => e.toEntity()).toList(),
    );
  }
}



