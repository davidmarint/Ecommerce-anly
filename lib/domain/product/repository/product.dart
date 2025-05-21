import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/domain/product/entities/products.dart';

abstract class ProductRepository {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsBycategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);
  Future<Either> addOrRemoveFavoriteProuct(ProductEntity product);
  Future<bool> isFAvorite(String productId);
  Future<Either> getFavoritesProducts();
}
