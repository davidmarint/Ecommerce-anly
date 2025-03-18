import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/auth/pages/forgot_password.dart';
import 'package:ecommerce_anly/widgets/appbar/app_bar.dart';
import 'package:ecommerce_anly/widgets/button/basic_app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EnterPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 16),
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
    return const TextField(
      
      decoration: InputDecoration(
        // labelText: 'Email',
        hintText: 'Enter your password',
        border: OutlineInputBorder()
      ),
    );
   }

    Widget _continueButton(BuildContext context){
      return BasicAppButton(
        text: 'Continue', 
        onPressed: (){});
    }

    Widget _forgotPassword(BuildContext context){
      return RichText(
        text:  TextSpan(
          text: 'Forgot password? ',
          style: const TextStyle(
            color: Colors.black,
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