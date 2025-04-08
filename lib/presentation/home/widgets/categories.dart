import 'package:ecommerce_anly/bloc/categories/categories_display_cubit.dart';
import 'package:ecommerce_anly/bloc/categories/categories_display_state.dart';
import 'package:ecommerce_anly/domain/category/entity/category.dart';
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
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoriesLoaded) {
            return Column(
              children: [
                _seaAll(),
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

  Widget _seaAll() {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Categories',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'See All',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          )
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
                Container(
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
