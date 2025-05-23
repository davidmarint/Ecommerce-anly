import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/order/models/add_to_card_req.dart';
import 'package:ecommerce_anly/data/order/models/order.dart';
import 'package:ecommerce_anly/data/order/models/order_registration_req.dart';
import 'package:ecommerce_anly/data/order/models/product_ordered.dart';
import 'package:ecommerce_anly/data/order/source/order_firebase_service.dart';
import 'package:ecommerce_anly/domain/order/repository/order.dart';
import 'package:ecommerce_anly/service_locator.dart';

class OrderRepositoryImpl extends OrderRepository{
  @override
  Future<Either> addToCart(AddToCardReq addToCardReq) {
    return sl<OrderFirebaseService>().addToCart(addToCardReq);
  }
  
  @override
  Future<Either> getCartProducts() async {
    var returnData = await sl<OrderFirebaseService>().getCartProducts();
    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductOrderedModel.fromMap(e).toEntity())
          .toList());
    });
  }
  
  @override
  Future<Either> removeCartProduct(String id) async {
 var returnData = await sl<OrderFirebaseService>().removeCartProduct(id);
    return returnData.fold((error) {
      return Left(error);
    }, (message) {
      return Right(message);
    });
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order) async {
   var returnData = await sl<OrderFirebaseService>().orderRegistration(order);
    return returnData.fold((error) {
      return Left(error);
    }, (message) {
      return Right(message);
    });
  }
  
  @override
  Future<Either> getOrders() async {
    var returnData = await sl<OrderFirebaseService>().getOrders();
    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => OrderModel.fromMap(e).toEntity())
          .toList());
    });
  }
}