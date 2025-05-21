
import 'package:ecommerce_anly/core/configs/theme/app_colors.dart';
import 'package:ecommerce_anly/domain/product/entities/products.dart';
import 'package:ecommerce_anly/domain/product/usecases/get_top_selling.dart';
import 'package:ecommerce_anly/presentation/home/bloc/products_display_cubit.dart';
import 'package:ecommerce_anly/presentation/home/bloc/products_display_state.dart';
import 'package:ecommerce_anly/service_locator.dart';
import 'package:ecommerce_anly/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDisplayCubit(useCase: sl<GetTopSellingUseCase>())..displayProducts(),
      child: BlocBuilder < ProductsDisplayCubit, ProductsDisplayState> (
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const CircularProgressIndicator(color: AppColors.secondary,);
          }
          if (state is ProductsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _topSelling(),
                const SizedBox(height: 20, ),
                _products(state.products)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

   Widget _topSelling() {
    return const Padding(
      padding: EdgeInsets.symmetric(
         horizontal: 16,
       ),
      child: Text(
        'Más vendido',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
         horizontal: 16,
       ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) {
          return ProductCard(
            productEntity: products[index],
          );
        },
        separatorBuilder: (context,index) => const SizedBox(width: 10,),
        itemCount: products.length
        ),
    );
  }
}