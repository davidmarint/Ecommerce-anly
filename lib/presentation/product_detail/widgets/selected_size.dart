

import 'package:ecommerce_anly/core/configs/theme/app_colors.dart';
import 'package:ecommerce_anly/domain/product/entities/products.dart';
import 'package:ecommerce_anly/helpers/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce_anly/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:ecommerce_anly/presentation/product_detail/widgets/product_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedSize extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedSize({
    required this.productEntity,
    super.key
    });

  @override

  Widget build(BuildContext context) {

     final List sizes =[
    's','m','l','xl','xxl'
  ];

    return GestureDetector(
      onTap: (){
         AppBottomsheet.display(
           context,
           BlocProvider.value(
             value:BlocProvider.of<ProductSizeSelectionCubit>(context),
             child: ProductSizes(sizes: sizes,)
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
              'Size',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14
              ),
            ),
            Row(
              children: [
                  BlocBuilder<ProductSizeSelectionCubit,int>(
                  builder: (context, state) => Text(
                    sizes[state],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
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
