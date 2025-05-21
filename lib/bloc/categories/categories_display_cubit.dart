
import 'package:ecommerce_anly/bloc/categories/categories_display_state.dart';
import 'package:ecommerce_anly/domain/category/usecases/get_categories.dart';
import 'package:ecommerce_anly/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesLoading());

  void displayCategories() async {
    var returnedData = await sl<GetCategoriesUseCase>().call();
    
    returnedData.fold(
      (failure) => emit(LoadCategoryFailure()),
      (categories) => emit(CategoriesLoaded(categories: categories)),
    );

  }

}