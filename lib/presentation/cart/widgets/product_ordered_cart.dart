import 'package:ecommerce_anly/core/configs/theme/app_colors.dart';
import 'package:ecommerce_anly/domain/order/entities/product_ordered.dart';
import 'package:ecommerce_anly/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductOrderedCard extends StatelessWidget {
  final ProductOrderedEntity productOrderedEntity;
  const ProductOrderedCard({
    required this.productOrderedEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                           
                              productOrderedEntity.productImageUrl
                            
                          )
                        ),
                        borderRadius: BorderRadius.circular(4)
                      ),
                    ),
                  ),
                  const SizedBox(width: 10, ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productOrderedEntity.productTitle,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      '\$${productOrderedEntity.totalPrice}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                      ),
                    ),
                     GestureDetector(
                       onTap: () {
                        context.read<CartProductsDisplayCubit>().removeCartProduct(productOrderedEntity);
                       },
                       child: Container(
                         height: 23,
                         width: 23,
                         decoration: const BoxDecoration(
                             color: Color(0xffFF8383),
                             shape: BoxShape.circle
                           ),
                           child: const Icon(
                             Icons.remove,
                             size: 15,
                           ),
                       ),
                     )
                ],
              ),
            )
          ],
        ),
    );
  }
}