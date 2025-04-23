

import 'package:ecommerce_anly/domain/product/entities/products.dart';

 class ProductPriceHelper {
 static double provideCurrentPrice(ProductEntity product){
  return product.discountedPrice != 0? 
  product.discountedPrice.toDouble() :
  product.price.toDouble();
  }
}