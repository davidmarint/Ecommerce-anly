import 'package:ecommerce_anly/bloc/button/button_state.dart';
import 'package:ecommerce_anly/bloc/button/button_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicReactiveButton extends StatelessWidget {
  const BasicReactiveButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.brown,
    this.textColor = Colors.white,
    this.borderRadius = 20,
    this.width,
    this.height = 40,
    this.padding = EdgeInsetsDirectional.zero,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
      builder: (context, state){
        if (state is ButtonLoadingState){
          return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 0),
              ),
            ]),
        child: const Center(
          child:  CircularProgressIndicator(backgroundColor: Colors.white,),
        ),
      ),
    );
        }

        return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 0),
              ),
            ]),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
          ),
        ),
      ),
    );
      }); 
    
    
  }
}
