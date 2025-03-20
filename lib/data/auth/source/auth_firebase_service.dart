import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_anly/data/auth/models/user_signin_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(UserCreationReq user);
  Future<Either> signIn(UserSigninReq user);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmail(String email);

}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signUp(UserCreationReq user) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(data.user!.uid)
          .set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'gener': user.gender,
        'age': user.age
      });
      return const Right('Sing Up was Successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      return Left(message);
    }
  }
  
  @override
  Future<Either> getAges() async {
   try{
         var returnedData = await FirebaseFirestore.instance.collection('Ages').get();
          return Right(returnedData.docs);
   } catch(e){
     return const Left('Please try again later');
   }
  }
  
  @override
  Future<Either> signIn(UserSigninReq user) async {
    try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);

      return const Right('Sing In was Successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Not user found for that email.';
      } else if (e.code == 'invalid-credentials') {
        message = 'Wrong password provided for that user.'; 
      }
      return Left(message);
    }
  }
  
  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Password reset email sent');
    }catch(e){
      return const Left('Please try again later');
    }
  }
}
