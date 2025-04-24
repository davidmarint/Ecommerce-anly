

import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/order/models/add_to_card_req.dart';

abstract class OrderRepository{

  Future<Either> addToCart(AddToCardReq addToCardReq);
}