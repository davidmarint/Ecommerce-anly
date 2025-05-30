import 'package:ecommerce_anly/bloc/button/button_state.dart';
import 'package:ecommerce_anly/bloc/button/button_state_generic_cubit.dart';
import 'package:ecommerce_anly/data/order/models/order_registration_req.dart';
import 'package:ecommerce_anly/domain/order/entities/product_ordered.dart';
import 'package:ecommerce_anly/domain/order/usecases/order_registration.dart';
import 'package:ecommerce_anly/helpers/cart/cart.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/cart/pages/order_placed.dart';
import 'package:ecommerce_anly/widgets/appbar/app_bar.dart';
import 'package:ecommerce_anly/widgets/button/basic_reactive_generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
   CheckOutPage({
     required this.products,
     super.key
   });

  final TextEditingController _addressCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text(
          'Verificación'
        ),
      ),
      body: BlocProvider(
        create: (context) => ButtonStateGenericCubit(),
        child: BlocListener < ButtonStateGenericCubit, ButtonState > (
          listener: (context, state) {
            if (state is ButtonSuccessState) {
             AppNavigator.pushAndRemove(context, const OrderPlacedPage());
            }
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(content: Text(state.errorMessage), behavior: SnackBarBehavior.floating, );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
              child: Builder(
                builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _addressField(context),
                      BasicReactiveGenericButton(
                        content: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${CartHelper.calculateCartSubtotal(products)}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                                const Text(
                                  'Realizar pedido',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                  ),
                                )
                              ],
                            ),
                        ),
                        onPressed: () {
                          context.read < ButtonStateGenericCubit > ().execute(
                            usecase: OrderRegistrationUseCase(),
                            params: OrderRegistrationReq(
                              products: products,
                              createdDate: DateTime.now().toString(),
                              itemCount: products.length,
                              totalPrice: CartHelper.calculateCartSubtotal(products),
                              shippingAddress: _addressCon.text
                            )
                          );
                        }
                      )
                    ],
                  );
                }
              ),
          ),
        ),
      ),
    );
  }

  Widget _addressField(BuildContext context) {
    return TextField(
      controller: _addressCon,
      minLines: 2,
      maxLines: 4,
      decoration: const InputDecoration(
        hintText: 'Dirección de envío'
      ),
    );
  }
}