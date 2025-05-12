import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/core/useCase/useCase.dart';
import 'package:ecommerce_anly/domain/product/entities/products.dart';
import 'package:ecommerce_anly/domain/product/repository/product.dart';
import 'package:ecommerce_anly/service_locator.dart';

class AddOrRemoveFavoriteProductUseCase implements Usecase<Either, ProductEntity> {
  @override
  Future<Either> call({ProductEntity? params}) async {
    return await sl<ProductRepository>().addOrRemoveFavoriteProuct(params!); 
  }
}