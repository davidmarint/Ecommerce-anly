import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_anly/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_anly/domain/auth/repository/auth.dart';
import 'package:ecommerce_anly/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {

  @override
  Future<Either<String, String>> signUp(UserCreationReq user) async {
    return await sl<AuthFirebaseService>().signUp(user);
  }
  
  @override
  Future<Either> getAges() async {
   return await sl<AuthFirebaseService>().getAges();
  }
}