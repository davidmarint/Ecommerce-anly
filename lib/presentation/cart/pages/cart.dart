import 'package:ecommerce_anly/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_anly/core/configs/theme/app_colors.dart';
import 'package:ecommerce_anly/domain/order/entities/product_ordered.dart';
import 'package:ecommerce_anly/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:ecommerce_anly/presentation/cart/bloc/cart_products_display_state.dart';
import 'package:ecommerce_anly/presentation/cart/widgets/check_out.dart';
import 'package:ecommerce_anly/presentation/cart/widgets/product_ordered_cart.dart';
import 'package:ecommerce_anly/widgets/appbar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(
          title: Text('Carro de compras'),
        ),
        body: BlocProvider(
          create: (context) =>
              CartProductsDisplayCubit()..displayCartProducts(),
          child:
              BlocBuilder<CartProductsDisplayCubit, CartProductsDisplayState>(
            builder: (context, state) {
              if (state is CartProductsLoading) {
                return const Center(child: CircularProgressIndicator(color: AppColors.secondary,));
              }
              if (state is CartProductsLoaded) {
                return state.products.isEmpty
                    ? Center(
                        child: _cartIsEmpty(),
                      )
                    : Stack(
                        children: [
                          _products(state.products),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Checkout(
                              products: state.products,
                            ),
                          )
                        ],
                      );
              }
              if (state is LoadCartProductsFailure) {
                return const Center(child: Text('Error al cargar los productos del carrito'));
              }
              return Container();
            },
          ),
        ));
  }

  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return ProductOrderedCard(
            productOrderedEntity: products[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: products.length);
  }

  Widget _cartIsEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.emptyCart),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'El carrito está vacío',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
