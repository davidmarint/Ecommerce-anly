
import 'package:ecommerce_anly/domain/product/entities/products.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key , required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(productEntity.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
      );
  }
}