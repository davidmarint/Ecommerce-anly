
import 'package:ecommerce_anly/domain/product/entities/products.dart';

abstract class ProductsDisplayState {}

class ProductsLoading extends ProductsDisplayState {}

class ProductsLoaded extends ProductsDisplayState {
  final List<ProductEntity> products;
  ProductsLoaded(this.products);
}
class LoadProductsFailure extends ProductsDisplayState {
 
}