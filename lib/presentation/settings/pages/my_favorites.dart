
import 'package:ecommerce_anly/domain/product/entities/products.dart';
import 'package:ecommerce_anly/domain/product/usecases/get_favorites_products.dart';
import 'package:ecommerce_anly/presentation/home/bloc/products_display_cubit.dart';
import 'package:ecommerce_anly/presentation/home/bloc/products_display_state.dart';
import 'package:ecommerce_anly/service_locator.dart';
import 'package:ecommerce_anly/widgets/appbar/app_bar.dart';
import 'package:ecommerce_anly/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavoritesPage  extends StatelessWidget {
  const MyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Mis favoritos'),

      ),
      body: BlocProvider(
        create: (context) => ProductsDisplayCubit(useCase: sl<GetFavortiesProductsUseCase>())..displayProducts(),
        child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>
        (builder: (context, state){
          if(state is ProductsLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is ProductsLoaded){
            return _products(state.products);
          }
          if(state is LoadProductsFailure){
            return const Center(child: Text('Please try again later'));
          }
          return Container();
        }),
    ),
    );
  }

   Widget _products(List<ProductEntity> products) {
    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(productEntity: products[index]);
        },
    );
  }
} 