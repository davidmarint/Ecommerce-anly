import 'package:ecommerce_anly/bloc/button/button_state.dart';
import 'package:ecommerce_anly/bloc/button/button_state_signin_cubit.dart';
import 'package:ecommerce_anly/core/configs/theme/app_colors.dart';
import 'package:ecommerce_anly/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/auth/pages/forgot_password.dart';
import 'package:ecommerce_anly/presentation/home/pages/home.dart';
import 'package:ecommerce_anly/widgets/appbar/app_bar.dart';
import 'package:ecommerce_anly/widgets/button/basic_signin_button.dart';
import 'package:ecommerce_anly/widgets/textField/text_field_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPassword extends StatelessWidget {
EnterPassword({super.key, required this.signinReq});

final UserSigninReq signinReq;

final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 16),
        child: BlocProvider(
          create: (context) => ButtonStateSigninCubit(),
          child: BlocListener<ButtonStateSigninCubit,ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState){
                var snackbar = SnackBar(content: Text(state.errorMessage),behavior: SnackBarBehavior.floating,);
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
              if (state is ButtonSuccessState){
                AppNavigator.pushAndRemove(context, const HomePage());
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _singinText(context),
                const SizedBox(height: 16),
                _passwordField(context),
                const SizedBox(height: 16),
                 _continueButton(context),
                 const SizedBox(height: 16),
               _forgotPassword(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _singinText(BuildContext context){
    return const Text(
      'Iniciar Sesión', 
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),);
  }

   Widget _passwordField(BuildContext context){
    return  PasswordTextField(controller: _passwordCon,);
   }

    Widget _continueButton(BuildContext context){
      return Builder(
        builder: (context) {
          return BasicSigninButton(
            title: 'Continuar', 
            onPressed: (){
              signinReq.password = _passwordCon.text;
              context.read<ButtonStateSigninCubit>().execute(
                params: signinReq
              );
            });
        }
      );
    }

    Widget _forgotPassword(BuildContext context){
      return RichText(
        text:  TextSpan(
          text: '¿Has olvidado tu contraseña? ',
          style: const TextStyle(
            fontSize: 14
          ),
          children: [
            TextSpan(
              text: 'Restablecer',
              recognizer: TapGestureRecognizer()..onTap = (){
                AppNavigator().push(context, ForgotPasswordPage());
              },
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14
              )
            )
          ]
        ),
        
        );
    }
}