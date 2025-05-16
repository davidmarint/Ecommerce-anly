import 'package:ecommerce_anly/core/configs/theme/app_colors.dart';
import 'package:ecommerce_anly/domain/order/entities/product_ordered.dart';
import 'package:flutter/material.dart';

class OrderItemCard extends StatelessWidget {
  final ProductOrderedEntity productOrderedEntity;
  const OrderItemCard({
    required this.productOrderedEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    print(productOrderedEntity.productPrice);
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
            Text(
                '\$${productOrderedEntity.totalPrice}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14
                ),
              )
          ],
        ),
    );
  }
}