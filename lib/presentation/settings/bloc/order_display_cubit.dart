import 'package:ecommerce_anly/domain/order/usecases/get_orders.dart';
import 'package:ecommerce_anly/presentation/settings/bloc/order_display_state.dart';
import 'package:ecommerce_anly/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersDisplayCubit extends Cubit<OrderDisplayState> {
  OrdersDisplayCubit() : super(OrdersLoading());

  void displayOrders() async {
   var returnedData = await sl<GetOrdersUseCase>().call(); 
    returnedData.fold((error) {
      emit(LoadOrdersFailure(error));
    }, (data) {
      emit(OrdersLoaded(data));
    });
  }
}