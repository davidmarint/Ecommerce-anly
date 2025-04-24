import 'package:ecommerce_anly/bloc/button/button_state.dart';
import 'package:ecommerce_anly/bloc/button/button_state_generic_cubit.dart';
import 'package:ecommerce_anly/data/order/models/add_to_card_req.dart';
import 'package:ecommerce_anly/domain/order/usecases/add_to_card.dart';
import 'package:ecommerce_anly/domain/product/entities/products.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/helpers/product/product_price.dart';
import 'package:ecommerce_anly/presentation/home/pages/home.dart';
import 'package:ecommerce_anly/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:ecommerce_anly/widgets/button/basic_reactive_generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToBag({
    required this.productEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateGenericCubit,ButtonState>(
      listener: (context, state) {
        if (state is ButtonSuccessState) {
          AppNavigator().push(context, const HomePage());
        } 
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(content: Text(state.errorMessage),behavior: SnackBarBehavior.floating,);
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
          child: BasicReactiveGenericButton(
            onPressed: () {
               context.read<ButtonStateGenericCubit>().execute(
                 usecase: AddToCardUseCase(),
                 params: AddToCardReq(
                   productId: productEntity.productId, 
                   productTitle: productEntity.title,
                   productQuantity: context.read<ProductQuantityCubit>().state,
                   productPrice: productEntity.price.toDouble(), 
                   totalPrice: ProductPriceHelper.provideCurrentPrice(productEntity) * context.read<ProductQuantityCubit>().state,
                   productImageUrl: productEntity.images[0],
                   createdDate: DateTime.now().toString()
                 )
              );
            },
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<ProductQuantityCubit,int>(
                  builder: (context, state) {
                   var price = ProductPriceHelper.provideCurrentPrice(productEntity) * state;
                   return Text(
                    "\$${price.toString()}",
                    style: const TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                     fontSize: 14
                   ),
                  );
                }, 
              ),
              const Text(
                 'Add to Bag',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14
                ),
              ),
            ],
          )
      ),
        ),
    );
 }
}