import 'package:ecommerce_anly/domain/order/entities/product_ordered.dart';
import 'package:ecommerce_anly/domain/order/usecases/get_cart_products.dart';
import 'package:ecommerce_anly/domain/order/usecases/remove_cart_products.dart';
import 'package:ecommerce_anly/presentation/cart/bloc/cart_products_display_state.dart';
import 'package:ecommerce_anly/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsDisplayCubit extends Cubit<CartProductsDisplayState> {
  CartProductsDisplayCubit() : super(CartProductsLoading());

  void displayCartProducts()async{
    var returnedData = await sl<GetCartProductsUseCase>().call();

    returnedData.fold(
      (error){
        emit(LoadCartProductsFailure(errorMessage: error));
      }, 
      (data){
        emit(CartProductsLoaded(products: data));
      });
  }

  void removeCartProduct(ProductOrderedEntity product)async{
    emit(CartProductsLoading());
    var returnedData = await sl<RemoveCartproductsUseCase>().call(params: product.id);

    returnedData.fold(
      (error){
        emit(LoadCartProductsFailure(errorMessage: error));
      }, 
      (data){
        displayCartProducts();
      });
  }

}