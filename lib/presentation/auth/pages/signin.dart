import 'package:ecommerce_anly/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/auth/pages/enter_password.dart';
import 'package:ecommerce_anly/presentation/auth/pages/signup.dart';
import 'package:ecommerce_anly/widgets/appbar/app_bar.dart';
import 'package:ecommerce_anly/widgets/button/basic_app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
   
  final TextEditingController _emailCon = TextEditingController(text: 'maicolmarin0126@gmail.com');
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const BasicAppbar(hideBack: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40, 
          horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _singinText(context),
            const SizedBox(height: 16),
            _emailField(context),
            const SizedBox(height: 16),
             _continueButton(context),
             const SizedBox(height: 16),
           _createAccount(context),
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

   Widget _emailField(BuildContext context){
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: 'Enter your email',
        border: OutlineInputBorder()
      ),
    );
   }

    Widget _continueButton(BuildContext context){
      return BasicAppButton(
        text: 'Continue', 
        onPressed: (){
          AppNavigator().push(context,
          EnterPassword(
            signinReq: UserSigninReq(
              email: _emailCon.text,
            )
          ));
        });
    }

    Widget _createAccount(BuildContext context){
      return RichText(
        text:  TextSpan(
          text: 'Don\'t have an account? ',
          style: const TextStyle(
            fontSize: 14
          ),
          children: [
            TextSpan(
              text: 'Create One',
              recognizer: TapGestureRecognizer()..onTap = (){
                AppNavigator().push(context, SignUpPage());
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