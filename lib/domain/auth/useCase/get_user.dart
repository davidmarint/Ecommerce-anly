import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/core/useCase/useCase.dart';
import 'package:ecommerce_anly/domain/auth/repository/auth.dart';
import 'package:ecommerce_anly/service_locator.dart';

class GetUserUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepository>().getUser(); 
  }
}