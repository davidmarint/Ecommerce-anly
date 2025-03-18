import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_anly/presentation/auth/blog/age_selection_cubit.dart';
import 'package:ecommerce_anly/presentation/auth/blog/ages_display_cubit.dart';
import 'package:ecommerce_anly/presentation/auth/blog/ages_display_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.7,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayStates>(
        builder: (context, state) {
          if (state is AgesLoading) {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }
          if (state is AgesLoaded) {
            return ListView.builder(
              itemCount: state.ages.length,
              itemBuilder: (context, index) {
                return _ages(state.ages);
              },
            );
          }

          if (state is AgesLoadFaiture) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
        shrinkWrap: true, 
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
              context
                  .read<AgeSelectionCubit>()
                  .selectAge(ages[index].data()['value']);
            },
            child: Center(
              child: Text(ages[index].data()['value'],
                  style: const TextStyle(fontSize: 18)),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: ages.length);
  }
}
