part of 'local_cart_cubit.dart';

sealed class LocalCartState extends Equatable {
  const LocalCartState();

  @override
  List<Object> get props => [];
}

final class LocalCartInitial extends LocalCartState {}

final class LocalCartLoadingState extends LocalCartState {}

final class LocalCartErrorState extends LocalCartState {
  final String message;

  const LocalCartErrorState({required this.message});
}

final class LocalCartLoadedState extends LocalCartState {}

final class LocalCartGetedState extends LocalCartState {
  final Cart? localCart;
  const LocalCartGetedState({required this.localCart});
}
