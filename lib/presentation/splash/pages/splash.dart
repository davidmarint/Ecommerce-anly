import 'package:ecommerce_anly/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/auth/pages/signin.dart';
import 'package:ecommerce_anly/presentation/home/pages/home.dart';
import 'package:ecommerce_anly/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce_anly/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if(state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, SignInPage());
          } else if(state is Authenticated) {
            AppNavigator.pushReplacement(context, const HomePage());

          }
        },
      child: Scaffold(
        //backgroundColor: AppColors.primary,
        backgroundColor: Colors.blue,
        body: Center(
          child: SvgPicture.asset(
          AppVectors.appLogo
          ),
        ),
      ),
    );
  }
}