import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/order/models/add_to_card_req.dart';
import 'package:ecommerce_anly/data/order/source/order_firebase_service.dart';
import 'package:ecommerce_anly/domain/order/repository/order.dart';
import 'package:ecommerce_anly/service_locator.dart';

class OrderRepositoryImpl extends OrderRepository{
  @override
  Future<Either> addToCart(AddToCardReq addToCardReq) {
    return sl<OrderFirebaseService>().addToCart(addToCardReq);
  }
}