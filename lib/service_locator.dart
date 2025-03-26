
import 'package:ecommerce_anly/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce_anly/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_anly/domain/auth/repository/auth.dart';
import 'package:ecommerce_anly/domain/auth/useCase/get_ages.dart';
import 'package:ecommerce_anly/domain/auth/useCase/get_user.dart';
import 'package:ecommerce_anly/domain/auth/useCase/is_logged_in.dart';
import 'package:ecommerce_anly/domain/auth/useCase/send_password_reset_email.dart';
import 'package:ecommerce_anly/domain/auth/useCase/signin.dart';
import 'package:ecommerce_anly/domain/auth/useCase/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

//services

sl.registerSingleton<AuthFirebaseService>(
  AuthFirebaseServiceImpl()
);

//repositories

sl.registerSingleton<AuthRepository>(
  AuthRepositoryImpl()
);

//usecases

 sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
 );

sl.registerSingleton<GetAgesUseCase>(
    GetAgesUseCase()
 );

 sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
 );

 sl.registerSingleton<SendPasswordUseCase>(
    SendPasswordUseCase()
 );

sl.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase()
 );

 sl.registerSingleton<GetUserUseCase>(
    GetUserUseCase()
 );



}