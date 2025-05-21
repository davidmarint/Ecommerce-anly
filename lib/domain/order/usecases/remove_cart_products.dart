import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/core/useCase/useCase.dart';
import 'package:ecommerce_anly/domain/order/repository/order.dart';
import 'package:ecommerce_anly/service_locator.dart';

class RemoveCartproductsUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<OrderRepository>().removeCartProduct(params!); 
  }
}