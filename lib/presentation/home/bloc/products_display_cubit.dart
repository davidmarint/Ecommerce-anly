
import 'package:ecommerce_anly/core/useCase/useCase.dart';
import 'package:ecommerce_anly/presentation/home/bloc/products_display_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final Usecase useCase;
  ProductsDisplayCubit({required this.useCase}) : super(ProductsInitialState());

  void displayProducts({dynamic params}) async{
   emit(ProductsLoading());
    var returnedData = await useCase.call(
      params: params,
    );
    returnedData.fold(
      (failure) {
        emit(LoadProductsFailure());
      },
      (products) {
        emit(ProductsLoaded(products));
      },
    ); 
  }

  void displayInitial() {
    emit(
      ProductsInitialState()
    );
  }

}