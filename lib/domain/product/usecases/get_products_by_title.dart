import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/core/useCase/useCase.dart';
import 'package:ecommerce_anly/domain/product/repository/product.dart';
import 'package:ecommerce_anly/service_locator.dart';

class GetProductsByTitleUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<ProductRepository>().getProductsByTitle(params!); 
  }
}