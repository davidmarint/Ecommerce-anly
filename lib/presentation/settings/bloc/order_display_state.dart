import 'package:ecommerce_anly/domain/order/entities/order.dart';

abstract class OrderDisplayState {
  const OrderDisplayState();
}

class OrdersLoading extends OrderDisplayState {}

class OrdersLoaded extends OrderDisplayState{
  final List<OrderEntity> orders;
  const OrdersLoaded(this.orders);
}

class LoadOrdersFailure extends OrderDisplayState{
  final String message;
  const LoadOrdersFailure(this.message);
}