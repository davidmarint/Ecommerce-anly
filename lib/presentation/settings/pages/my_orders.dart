import 'package:ecommerce_anly/core/configs/theme/app_colors.dart';
import 'package:ecommerce_anly/domain/order/entities/order.dart';
import 'package:ecommerce_anly/helpers/navigator/app_navigator.dart';
import 'package:ecommerce_anly/presentation/settings/bloc/order_display_cubit.dart';
import 'package:ecommerce_anly/presentation/settings/bloc/order_display_state.dart';
import 'package:ecommerce_anly/presentation/settings/pages/order_detail.dart';
import 'package:ecommerce_anly/widgets/appbar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
          title: Text(
            'Mis pedidos',
          ),
        ),
        body: BlocProvider(
          create: (context) => OrdersDisplayCubit()..displayOrders(),
          child: BlocBuilder<OrdersDisplayCubit,OrderDisplayState>(
            builder: (context, state) {
              if (state is OrdersLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is OrdersLoaded){
                return _orders(state.orders);
              }
              if (state is LoadOrdersFailure){
                return Center(
                  child: Text(
                    state.message
                  ),
                );
              }
              return Container();
            },
          )
        )
    );
  }

  Widget _orders(List<OrderEntity> orders) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
               AppNavigator().push(
                 context, 
                 OrderDetailPage(orderEntity: orders[index],)
               );
            },
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.receipt_rounded
                        ),
                        const SizedBox(width: 20, ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pedido #${orders[index].code}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16
                              ),
                            ),
                            Text(
                              '${orders[index].products.length} artículo(s)',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.grey
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded
                    )
                  ],
                ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20, ),
        itemCount: orders.length
    );
  }
}