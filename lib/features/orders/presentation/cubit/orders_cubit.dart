import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/orders/domain/entities/order_cart.dart';
import 'package:shop/features/orders/domain/entities/order_details.dart';
import 'package:shop/features/orders/domain/usecases/get_order_details_usercase.dart';
import 'package:shop/features/orders/domain/usecases/get_shipped_order_usercase.dart';
import 'package:shop/features/orders/domain/usecases/get_un_shipped_order_usecase.dart';
import 'package:shop/features/orders/domain/usecases/shipe_order_usecase.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetShippedOrderUsercase getShippedOrderUsercase;
  final GetUnShippedOrderUsecase getUnShippedOrderUsecase;
  final ShipeOrderUsecase shipeOrderUsecase;
  final GetOrderDetailsUsercase getOrderDetailsUsercase;
  OrdersCubit(
      {required this.getShippedOrderUsercase,
      required this.getUnShippedOrderUsecase,
      required this.shipeOrderUsecase,
      required this.getOrderDetailsUsercase})
      : super(OrdersInitial());
  Future<void> getShippedOrders() async {
    emit(OrdersLoadingState());
    final result = await getShippedOrderUsercase();
    result.fold((l) => emit(OrdersErrorState(message: l.message)),
        (r) => emit(OrdersLoadedState(carts: r)));
  }

  Future<void> getUnShippedOrders() async {
    emit(OrdersLoadingState());
    final result = await getUnShippedOrderUsecase();
    result.fold((l) => emit(OrdersErrorState(message: l.message)),
        (r) => emit(OrdersLoadedState(carts: r)));
  }

  Future<void> shipeOrder({required int id}) async {
    emit(OrdersLoadingState());
    final result = await shipeOrderUsecase(id);
    result.fold((l) => emit(OrdersErrorState(message: l.message)),
        (r) => emit(OrderShipedState()));
  }

  Future<void> getOrderDetails({required int cartId}) async {
    emit(OrdersLoadingState());
    final result = await getOrderDetailsUsercase(cartId);
    result.fold((l) => emit(OrdersErrorState(message: l.message)),
        (r) => emit(OrdersGetedOrderDetailsState(orderDetails: r)));
  }
}
