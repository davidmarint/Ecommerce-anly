import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/auth/pages/enter_password.dart';
import 'package:ecommerce_anly/widgets/appbar/app_bar.dart';
import 'package:ecommerce_anly/widgets/button/basic_app_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const  EdgeInsets.symmetric(
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
          ],
        ),
      ),
    );
  }

  Widget _singinText(BuildContext context){
    return const Text(
      'Fotgot Password', 
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),);
  }

   Widget _emailField(BuildContext context){
    return const TextField(
      
      decoration: InputDecoration(
        // labelText: 'Email',
        hintText: 'Enter your email',
        border: OutlineInputBorder()
      ),
    );
   }

    Widget _continueButton(BuildContext context){
      return BasicAppButton(
        text: 'Continue', 
        onPressed: (){
          AppNavigator().push(context, EnterPassword());
        });
    }

}