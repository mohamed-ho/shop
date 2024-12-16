part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartErrorState extends CartState {
  final String message;

  const CartErrorState({required this.message});
}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {}

class CartGetedCartsState extends CartState {
  final List<Cart> carts;

  const CartGetedCartsState({required this.carts});
}

class CartGetedSingleCartState extends CartState {
  final Cart cart;

  const CartGetedSingleCartState({required this.cart});
}
