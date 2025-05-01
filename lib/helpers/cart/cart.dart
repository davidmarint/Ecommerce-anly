
 import 'package:ecommerce_anly/domain/order/entities/product_ordered.dart';

class CartHelper {
 static double calculateCartSubtotal(List<ProductOrderedEntity> products){
  double subtotal = 0;
  for (var item in products) {
   subtotal += item.totalPrice;
  }
  return subtotal;
 }
}