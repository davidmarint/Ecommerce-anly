import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_anly/data/auth/models/user_signin_req.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserCreationReq user);
  Future<Either> signIn(UserSigninReq user);
  Future<Either> getAges();
  // Future<Either<Failure, User>> signUpWithEmailAndPassword(
  //     {required String email, required String password});

  // Future<Either<Failure, User>> signInWithGoogle();

  //Future<void> signOut();
}