import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/core/useCase/useCase.dart';
import 'package:ecommerce_anly/data/order/models/order_registration_req.dart';
import 'package:ecommerce_anly/domain/order/repository/order.dart';
import 'package:ecommerce_anly/service_locator.dart';

class OrderRegistrationUseCase implements Usecase<Either, OrderRegistrationReq> {
  @override
  Future<Either> call({OrderRegistrationReq ? params}) async {
    return await sl<OrderRepository>().orderRegistration(params!); 
  }
}