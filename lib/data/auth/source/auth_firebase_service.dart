import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/auth/models/user_creation_req.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(UserCreationReq user);
    Future<Either> getAges();

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
}
