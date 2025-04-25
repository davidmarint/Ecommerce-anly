import 'package:ecommerce_anly/domain/order/entities/product_ordered.dart';
import 'package:ecommerce_anly/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:ecommerce_anly/presentation/cart/bloc/cart_products_display_state.dart';
import 'package:ecommerce_anly/presentation/cart/widgets/product_ordered_cart.dart';
import 'package:ecommerce_anly/widgets/appbar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title:  Text('Cart'),
      ),
      body: BlocProvider(
        create: (context)=> CartProductsDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductsDisplayCubit, CartProductsDisplayState>(
          builder: (context, state){
            if(state is CartProductsLoading){
              return const Center(child: CircularProgressIndicator());
            }
            if(state is CartProductsLoaded){
              return _products(state.products);
            }
            if(state is LoadCartProductsFailure){
              return const Center(child: Text('Error loading cart products'));
            }
            return Container();
          },),
      )
    );
  }

  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index){
      return  ProductOrderedCard(productOrderedEntity: products[index],);
    }, 
    separatorBuilder: (context, index) => const SizedBox(height: 10,), 
    itemCount: products.length);
  }

}