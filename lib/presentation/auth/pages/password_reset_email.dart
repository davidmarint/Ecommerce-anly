import 'package:ecommerce_anly/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/auth/pages/signin.dart';
import 'package:ecommerce_anly/widgets/button/basic_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _emailSending(),
          const SizedBox(height: 30,),
          _sentEmail(),
          const SizedBox(height: 30,),
          _returnToLoginButton(context)
        ],
      ),
    );
  }
  Widget _emailSending() {
    return Center(
      child: SvgPicture.asset(
        AppVectors.emailSending
      ),
    );
  }

  Widget _sentEmail() {
    return const Column(
      children: [
        Center(
          child: Text(
            'Te enviamos un correo electrónico para '
          ),
        ),
        Center(
          child: Text(
            'restablecer tu contraseña.'
          ),
        ),
      ],
    );
  }

  Widget _returnToLoginButton(BuildContext context) {
    return BasicAppButton(
      onPressed: (){
        AppNavigator.pushReplacement(context, SignInPage());
      },
      width: 250,
      text: 'Regresar a iniciar de sesión'
    );
  }
}