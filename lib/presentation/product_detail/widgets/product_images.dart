import 'package:ecommerce_anly/domain/product/entities/products.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      productEntity.images[index]
                  )
                ),
                borderRadius: BorderRadius.circular(8)
              ),
            );
          },
          separatorBuilder: (context, index) =>
             const SizedBox(width: 10,),
          itemCount: productEntity.images.length,
          ),
    );
  }
}
