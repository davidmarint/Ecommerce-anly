
import 'package:ecommerce_anly/domain/product/usecases/get_top_selling.dart';
import 'package:ecommerce_anly/presentation/home/bloc/top_selling_display_state.dart';
import 'package:ecommerce_anly/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSellingDisplayCubit extends Cubit<TopSellingDisplayState> {
  TopSellingDisplayCubit() : super(ProductsLoading());

  void displayProducts() async{
    var returnedData = await sl<GetTopSellingUseCase>().call();
    returnedData.fold(
      (failure) {
        emit(LoadProductsFailure());
      },
      (products) {
        emit(ProductsLoaded(products));
      },
    ); 
  }

}