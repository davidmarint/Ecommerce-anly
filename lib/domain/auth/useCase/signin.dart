import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/core/useCase/useCase.dart';
import 'package:ecommerce_anly/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_anly/domain/auth/repository/auth.dart';
import 'package:ecommerce_anly/service_locator.dart';

class SigninUseCase implements Usecase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq ? params}) async {
    return await sl<AuthRepository>().signIn(params!); 
  }
}