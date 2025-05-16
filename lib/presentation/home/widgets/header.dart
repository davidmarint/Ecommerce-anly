import 'package:ecommerce_anly/core/configs/assets/app_images.dart';
import 'package:ecommerce_anly/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_anly/core/configs/theme/app_colors.dart';
import 'package:ecommerce_anly/domain/auth/entity/user.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/cart/pages/cart.dart';
import 'package:ecommerce_anly/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:ecommerce_anly/presentation/home/bloc/user_info_display_state.dart';
import 'package:ecommerce_anly/presentation/settings/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 16,
          right: 16,
        ),
        child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
          builder: (context, state) {
             if (state is UserInfoLoading) {
               return const Center(
                 child: CircularProgressIndicator(),
               );
             }
            if (state is UserInfoLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profileImage(state.user, context),
                  _gender(state.user),
                  _card(context)
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _profileImage(UserEntity user, BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator().push(context, const SettingsPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: user.image.isEmpty
                    ? const AssetImage(AppImages.icon)
                    : NetworkImage(user.image)),
           color: AppColors.primary,
            shape: BoxShape.circle),
      ),
    );
  }

  Widget _gender(UserEntity user) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          //color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: SvgPicture.asset(
          AppVectors.anly,
          height: 30,
          width: 30,
          ),
      ),
    );
  }

  Widget _card(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator().push(context,const CartPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
            color: AppColors.primary, shape: BoxShape.circle),
        child: SvgPicture.asset(
          AppVectors.bag,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
