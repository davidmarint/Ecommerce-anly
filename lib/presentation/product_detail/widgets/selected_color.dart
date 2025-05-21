

import 'package:ecommerce_anly/core/configs/theme/app_colors.dart';
import 'package:ecommerce_anly/domain/product/entities/products.dart';
import 'package:ecommerce_anly/helpers/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce_anly/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:ecommerce_anly/presentation/product_detail/widgets/product_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedColor extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedColor({
    required this.productEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {


final List<ColorModel> colors = [
  ColorModel(title: 'Red', rgb: [255, 0, 0]),
  ColorModel(title: 'Green', rgb: [0, 255, 0]),
  ColorModel(title: 'Blue', rgb: [0, 0, 255]),
  ColorModel(title: 'Yellow', rgb: [255, 255, 0]),
];

    return GestureDetector(
      onTap: (){
        //AppBottomsheet.display(context, ProductColors(colors: colores,));
         AppBottomsheet.display(
           context,
           BlocProvider.value(
             value:BlocProvider.of<ProductColorSelectionCubit>(context),
             child: ProductColors(colors: colors)
          )
      );
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Color',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14
              ),
            ),
            Row(
              children: [
                BlocBuilder<ProductColorSelectionCubit,int>(
                  builder: (context, state) =>  Container(
                    height: 20,
                    width: 20,
                    decoration:  BoxDecoration(
                      color: Color.fromRGBO( 
                        colors[state].rgb[0],
                        colors[state].rgb[1],
                        colors[state].rgb[2],
                        1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ColorModel {
  final String title;
  final List<int> rgb;

  ColorModel({
    required this.title,
    required this.rgb,
  });
}