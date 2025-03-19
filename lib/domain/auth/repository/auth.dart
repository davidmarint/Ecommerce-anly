import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/auth/models/user_creation_req.dart';

abstract class AuthRepository {
  Future<Either<String, String>> signUp(UserCreationReq user);
  Future<Either> getAges();
  //     {required String email, required String password});

  // Future<Either<Failure, User>> signInWithGoogle();

  //Future<void> signOut();
}