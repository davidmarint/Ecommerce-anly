
import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/category/models/category.dart';
import 'package:ecommerce_anly/data/category/source/category_firebase_sevice.dart';
import 'package:ecommerce_anly/domain/category/repository/category.dart';
import 'package:ecommerce_anly/service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository{
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryFirebaseSevice>().getCategories();
  return categories.fold(
      (error) =>  Left(error),
      (data) {
        return Right(
        List.from(data).map((e) => CategoryModel.fromMap(e).toEntity()).toList()
        );
      },
    );
  }
}