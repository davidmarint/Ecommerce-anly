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
  Future<bool> isLoggedIn();
  Future<Either> getUser();
  Future<Either> signOut();
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
      return const Right('El Registro fue exitoso');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'La contraseña proporcionada es demasiado débil.';
      } else if (e.code == 'email-already-in-use') {
        message = 'La cuenta ya existe para ese correo electrónico.';
      } else  if (e.code == 'invalid-email') {
        message = 'El correo electrónico no tiene un formato válido.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Ages').get();
      return Right(returnedData.docs);
    } catch (e) {
      return const Left('Por favor, inténtelo de nuevo más tarde');
    }
  }

  @override
  Future<Either> signIn(UserSigninReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        return const Right('Iniciar sesión fue exitoso');
      } else {
        return const Left('Error: La sesión no se mantuvo correctamente.');
      }
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'El correo electrónico no tiene un formato válido.';
      } else if (e.code == 'user-not-found') {
        message = 'No se encontró usuario para ese correo electrónico.';
      } else if (e.code == 'wrong-password') {
        message = 'Contraseña incorrecta.';
      } else if (e.code == 'invalid-email') {
        message = 'No se encontró usuario para ese correo electrónico.';
      } else if (e.code == 'invalid-credential') {
        message = 'Correo o contraseña incorrecta.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right(
          'Correo electrónico de restablecimiento de contraseña enviado');
    } catch (e) {
      return const Left('Por favor, inténtelo de nuevo');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      try {
        await currentUser.getIdToken(true);
        return true;
      } catch (e) {
        return false;
      }
    }

    return false;
  }

  @override
  Future<Either> getUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .get()
          .then((value) => value.data());
      return Right(userData);
    } catch (e) {
      return const Left('Please try again later');
    }
  }

  @override
  Future<Either> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return const Right('El cierre de sesión fue exitoso');
    } catch (e) {
      return Left('Error al cerrar sesión: ${e.toString()}');
    }
  }
}
