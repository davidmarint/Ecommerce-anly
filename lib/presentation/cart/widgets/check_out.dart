import 'package:ecommerce_anly/core/configs/theme/app_colors.dart';
import 'package:ecommerce_anly/domain/order/entities/product_ordered.dart';
import 'package:ecommerce_anly/helpers/cart/cart.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/cart/pages/checkout.dart';
import 'package:ecommerce_anly/widgets/button/basic_app_button.dart';
import 'package:flutter/material.dart';


class Checkout extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const Checkout({
    required this.products,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height / 3.5,
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
                ),
              ),
              Text(
                '\$${CartHelper.calculateCartSubtotal(products).toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              )
            ],
          ),
             const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Costo de envío',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
                ),
              ),
              Text(
                '\$8',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              )
            ],
          ),
             const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Impuesto',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
                ),
              ),
              Text(
                '\$0.0',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
                ),
              ),
              Text(
                '\$${CartHelper.calculateCartSubtotal(products) + 8 }',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              )
            ],
          ),
          BasicAppButton(
            onPressed: (){
              AppNavigator().push(context, CheckOutPage(products: products,));
            },
            text: 'Verificar pedido',
          )
        ],
      ),
    );
  }
}