import 'package:ecommerce_anly/bloc/button/button_state.dart';
import 'package:ecommerce_anly/bloc/button/button_state_generic_cubit.dart';
import 'package:ecommerce_anly/domain/auth/useCase/send_password_reset_email.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/auth/pages/password_reset_email.dart';
import 'package:ecommerce_anly/widgets/appbar/app_bar.dart';
import 'package:ecommerce_anly/widgets/button/basic_reactive_generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
   ForgotPasswordPage({super.key});

  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) => ButtonStateGenericCubit(),
        child:  BlocListener<ButtonStateGenericCubit,ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState){
                var snackbar = SnackBar(content: Text(state.errorMessage),behavior: SnackBarBehavior.floating,);
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
              if (state is ButtonSuccessState){
                AppNavigator().push(context, const PasswordResetEmailPage());
              }
            },
          child: Padding(
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
                 _continueButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _singinText(BuildContext context){
    return const Text(
      'Has olvidado tu contraseña', 
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),);
  }

   Widget _emailField(BuildContext context){
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: 'Ingresa tu correo',
        border: OutlineInputBorder()
      ),
    );
   }

    Widget _continueButton(){
      return Builder(
        builder: (context) {
          return BasicReactiveGenericButton(
            title: 'Continuar', 
            onPressed: (){
              context.read<ButtonStateGenericCubit>().execute(
                usecase: SendPasswordUseCase(),
                params: _emailCon.text);
            });
        }
      );
    }

}