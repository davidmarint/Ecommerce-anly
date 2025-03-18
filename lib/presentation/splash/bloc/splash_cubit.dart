import 'package:ecommerce_anly/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  
  SplashCubit(/*this._authRepository*/) : super(DisplaySplash());

  //final AuthRepository _authRepository;

    void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(UnAuthenticated());
    }

  // void checkUser() async {
  //   emit(SplashLoading());
  //   final user = await _authRepository.getUser();
  //   if (user != null) {
  //     emit(SplashAuthenticated(user));
  //   } else {
  //     emit(SplashUnauthenticated());
  //   }
  // }
    }