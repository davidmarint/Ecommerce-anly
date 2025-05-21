import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/core/useCase/useCase.dart';
import 'package:ecommerce_anly/domain/order/repository/order.dart';
import 'package:ecommerce_anly/service_locator.dart';

class GetCartProductsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<OrderRepository>().getCartProducts(); 
  }
}