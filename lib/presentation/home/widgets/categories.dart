import 'package:ecommerce_anly/bloc/categories/categories_display_cubit.dart';
import 'package:ecommerce_anly/bloc/categories/categories_display_state.dart';
import 'package:ecommerce_anly/core/configs/theme/app_colors.dart';
import 'package:ecommerce_anly/domain/category/entities/category.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/all_categories/pages/all_categories.dart';
import 'package:ecommerce_anly/presentation/category_products/pages/category_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.secondary,),
            );
          }
          if (state is CategoriesLoaded) {
            return Column(
              children: [
                _seaAll(context),
                const SizedBox(
                  height: 20,
                ),
                _categories(state.categories),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _seaAll(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         const Text(
            'Categorias',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
            AppNavigator().push(context, const AllCategoriesPage());
            },
            child: const Text(
              'Ver todas',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categories(List<CategoryEntity> categories) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (contetx, index) {
            return Column(
              children: [
                GestureDetector(
                  onDoubleTap: () {
                    AppNavigator().push(
                        contetx,
                        CategoryProductsPage(
                          categoryEntity: categories[index],
                        ));
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                         image: DecorationImage(
                             fit: BoxFit.fill,
                             image: NetworkImage(
                                   categories[index].image,
                             ))
                            ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  categories[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: categories.length),
    );
  }
}
