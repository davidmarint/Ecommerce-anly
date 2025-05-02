import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/core/useCase/useCase.dart';
import 'package:ecommerce_anly/data/order/models/add_to_card_req.dart';
import 'package:ecommerce_anly/domain/order/repository/order.dart';
import 'package:ecommerce_anly/service_locator.dart';

class AddToCardUseCase implements Usecase<Either, AddToCardReq> {
  @override
  Future<Either> call({AddToCardReq ? params}) async {
    return await sl<OrderRepository>().addToCart(params!); 
  }
}