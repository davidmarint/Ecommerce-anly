import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/core/useCase/useCase.dart';
import 'package:ecommerce_anly/domain/category/repository/category.dart';
import 'package:ecommerce_anly/service_locator.dart';

class GetCategoriesUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<CategoryRepository>().getCategories(); 
  }
}