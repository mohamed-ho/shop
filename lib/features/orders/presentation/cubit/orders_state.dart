part of 'orders_cubit.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersLoadingState extends OrdersState {}

class OrderShipedState extends OrdersState {}

class OrdersLoadedState extends OrdersState {
  final List<OrderCart> carts;

  const OrdersLoadedState({required this.carts});
}

class OrdersErrorState extends OrdersState {
  final String message;

  const OrdersErrorState({required this.message});
}

class OrdersGetedOrderDetailsState extends OrdersState {
  final OrderDetails orderDetails;

  const OrdersGetedOrderDetailsState({required this.orderDetails});
}
