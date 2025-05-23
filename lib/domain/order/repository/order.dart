import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/order/models/add_to_card_req.dart';
import 'package:ecommerce_anly/data/order/models/order_registration_req.dart';

abstract class OrderRepository{

  Future<Either> addToCart(AddToCardReq addToCardReq);
  Future<Either> getCartProducts();
  Future<Either> removeCartProduct(String id);
  Future<Either> orderRegistration(OrderRegistrationReq order);
  Future<Either> getOrders();
}