import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_anly/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_anly/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_anly/domain/auth/repository/auth.dart';
import 'package:ecommerce_anly/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {

  @override
  Future<Either> signUp(UserCreationReq user) async {
    return await sl<AuthFirebaseService>().signUp(user);
  }
  
  @override
  Future<Either> getAges() async {
   return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signIn(UserSigninReq user) async {
    return await sl<AuthFirebaseService>().signIn(user);
  }
  
  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }
  
  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthFirebaseService>().isLoggedIn();
  }
}