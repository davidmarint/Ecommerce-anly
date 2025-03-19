import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/core/useCase/useCase.dart';
import 'package:ecommerce_anly/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_anly/domain/auth/repository/auth.dart';
import 'package:ecommerce_anly/service_locator.dart';

class SignupUseCase implements Usecase<Either<String, String>, UserCreationReq> {
  @override
  Future<Either<String, String>> call({UserCreationReq ? params}) async {
    return await sl<AuthRepository>().signUp(params!); 
  }
}