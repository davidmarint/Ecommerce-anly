import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/core/useCase/useCase.dart';
import 'package:ecommerce_anly/domain/auth/repository/auth.dart';
import 'package:ecommerce_anly/service_locator.dart';

class SendPasswordUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<AuthRepository>().sendPasswordResetEmail(params!); 
  }
}