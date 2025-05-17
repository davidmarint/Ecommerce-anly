import 'package:ecommerce_anly/core/configs/theme/app_colors.dart';
import 'package:ecommerce_anly/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:ecommerce_anly/presentation/auth/pages/signin.dart';
import 'package:ecommerce_anly/widgets/appbar/app_bar.dart';
import 'package:ecommerce_anly/widgets/button/basic_app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _singinText(context),
            const SizedBox(height: 16),
            _firstNameField(context),
            const SizedBox(height: 16),
            _lastNameField(context),
            const SizedBox(height: 16),
            _emailField(context),
            const SizedBox(height: 16),
            _passwordField(context),
            const SizedBox(height: 16),
            _continueButton(context),
            const SizedBox(height: 16),
            _createAccount(context),
          ],
        ),
      ),
    );
  }

  Widget _singinText(BuildContext context) {
    return const Text(
      'Crear una cuenta',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _firstNameField(BuildContext context) {
    return TextField(
      controller: _firstNameCon,
      decoration: const InputDecoration(
          hintText: 'Primer nombre',
          hintStyle: TextStyle(color: AppColors.textColorSecond),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder( 
          borderSide: BorderSide(color: AppColors.secondary, width: 2.0),
        ),),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return TextField(
      controller: _lastNameCon,
      decoration: const InputDecoration(
          hintText: 'Segundo nombre',
          hintStyle: TextStyle(color: AppColors.textColorSecond),
           border: OutlineInputBorder(),
           focusedBorder: OutlineInputBorder( 
          borderSide: BorderSide(color: AppColors.secondary, width: 2.0),
        ),),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
          hintText: 'Correo electrónico',
          hintStyle: TextStyle(color: AppColors.textColorSecond),
           border: OutlineInputBorder(),
           focusedBorder: OutlineInputBorder( 
          borderSide: BorderSide(color: AppColors.secondary, width: 2.0),
        ),),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
          hintText: 'Contraseña',
          hintStyle: TextStyle(color: AppColors.textColorSecond),
           border: OutlineInputBorder(),
           focusedBorder: OutlineInputBorder( 
          borderSide: BorderSide(color: AppColors.secondary, width: 2.0),
        ),),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
        text: 'Continuar',
        onPressed: () {
          AppNavigator().push(
              context,
              GenderAndAgeSelectionPage(
                userCreationReq: UserCreationReq(
                    firstName: _firstNameCon.text,
                    lastName: _lastNameCon.text,
                    email: _emailCon.text,
                    password: _passwordCon.text),
              ));
        });
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: '¿Tienes una cuenta? ',
          style: const TextStyle(color: AppColors.textColor, fontSize: 14),
          children: [
            TextSpan(
                text: 'Iniciar sesión',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.pushReplacement(context, SignInPage());
                  },
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
          ]),
    );
  }
}
