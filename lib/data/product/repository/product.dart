import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/product/models/product.dart';
import 'package:ecommerce_anly/data/product/source/product_firebase_service.dart';
import 'package:ecommerce_anly/domain/product/entities/products.dart';
import 'package:ecommerce_anly/domain/product/repository/product.dart';
import 'package:ecommerce_anly/service_locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var returnData = await sl<ProductFirebaseService>().getTopSelling();

    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }
  
  @override
  Future<Either> getNewIn() async {
   var returnData = await sl<ProductFirebaseService>().getNewIn();

    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }
  
  @override
  Future<Either> getProductsBycategoryId(String categoryId) async {
     var returnData = await sl<ProductFirebaseService>().getProductsBycategoryId(categoryId);

    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }
  
  @override
  Future<Either> getProductsByTitle(String title) async {
    var returnData = await sl<ProductFirebaseService>().getProductsByTitle(title);
    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> addOrRemoveFavoriteProuct(ProductEntity product) async {
    var returnData = await sl<ProductFirebaseService>().addOrRemoveFavoriteProuct(product);
    return returnData.fold(
      (error) {
      return Left(error);
    }, (data) {
      return Right(data);
    });
  }
  
  @override
  Future<bool> isFAvorite(String productId) async {
    return await sl<ProductFirebaseService>().isFAvorite(productId);
  }
  
  @override
  Future<Either> getFavoritesProducts() async {
     var returnData = await sl<ProductFirebaseService>().getFavoritesProducts();
    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }
}
