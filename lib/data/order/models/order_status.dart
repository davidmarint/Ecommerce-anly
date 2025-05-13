import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_anly/domain/order/entities/order_status.dart';

class OrderStatusModel {
  final String title;
  final bool done;
  final Timestamp createDate;

  OrderStatusModel({
    required this.title, 
    required this.done, 
    required this.createDate});

      factory OrderStatusModel.fromMap(Map<String, dynamic> map) {
    return OrderStatusModel(
      title: map['title'] ?? '',
      done: map['done'] as bool,
      createDate: map['createdDate'] as Timestamp
    );
  }
}

extension OrderStatusXModel on OrderStatusModel {
  OrderStatusEntity toEntity() {
    return OrderStatusEntity(
      createDate: createDate,
      done: done,
      title: title
    );
  }
}
