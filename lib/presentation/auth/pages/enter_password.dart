import 'package:ecommerce_anly/bloc/button/button_state.dart';
import 'package:ecommerce_anly/bloc/button/button_state_signin_cubit.dart';
import 'package:ecommerce_anly/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/auth/pages/forgot_password.dart';
import 'package:ecommerce_anly/widgets/appbar/app_bar.dart';
import 'package:ecommerce_anly/widgets/button/basic_signin_button.dart';
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
                AppNavigator().push(context, ForgotPasswordPage());
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
      'Sign In', 
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),);
  }

   Widget _passwordField(BuildContext context){
    return  TextField(
      controller: _passwordCon ,
      decoration: const InputDecoration(
        hintText: 'Enter your password',
        border: OutlineInputBorder()
      ),
    );
   }

    Widget _continueButton(BuildContext context){
      return Builder(
        builder: (context) {
          return BasicSigninButton(
            title: 'Continue', 
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
          text: 'Forgot password? ',
          style: const TextStyle(
            fontSize: 14
          ),
          children: [
            TextSpan(
              text: 'Reset',
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