import 'package:ecommerce_anly/bloc/button/button_state.dart';
import 'package:ecommerce_anly/bloc/button/button_state_generic_cubit.dart';
import 'package:ecommerce_anly/core/configs/theme/app_colors.dart';
import 'package:ecommerce_anly/domain/auth/useCase/signOut.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/auth/pages/signin.dart';
import 'package:ecommerce_anly/presentation/settings/widgets/my_favorites.dart';
import 'package:ecommerce_anly/presentation/settings/widgets/my_orders_tile.dart';
import 'package:ecommerce_anly/widgets/appbar/app_bar.dart';
import 'package:ecommerce_anly/widgets/button/basic_reactive_generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Settings'),
      ),
      body:
      BlocProvider(create: (context) => ButtonStateGenericCubit(),
      child: BlocListener < ButtonStateGenericCubit, ButtonState >(
        listener: (context, state) {
          if(state is ButtonSuccessState){
             AppNavigator.pushAndRemove(context, SignInPage());
          }
        },
        child:
          Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const MyFavortiesTile(),
            const SizedBox(
              height: 15,
            ),
            const MyOrdersTile(),
            const Spacer(),
            _finishButton(context)
          ],
        ),
      ),
        ) ,)
      
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.secondBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Builder(builder: (context) {
          return BasicReactiveGenericButton(
            onPressed: () {
              context
                  .read<ButtonStateGenericCubit>()
                  .execute(usecase: SignoutUseCase());
            },
            title: 'Sign Out',
          );
        }),
      ),
    );
  }
}
