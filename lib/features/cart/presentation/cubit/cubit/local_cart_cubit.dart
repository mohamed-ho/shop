import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/cart/domain/entities/card_product.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/domain/usecases/add_to_local_cart_usecase.dart';
import 'package:shop/features/cart/domain/usecases/delete_item_from_local_cart_usecase.dart';
import 'package:shop/features/cart/domain/usecases/delete_local_cart_usecase.dart';
import 'package:shop/features/cart/domain/usecases/get_local_cart_usecase.dart';
import 'package:shop/features/cart/domain/usecases/update_from_local_cart_usecase.dart';

part 'local_cart_state.dart';

class LocalCartCubit extends Cubit<LocalCartState> {
  final AddToLocalCartUsecase addToLocalCartUsecase;
  final UpdateFromLocalCartUsecase updateFromLocalCartUsecase;
  final DeleteItemFromLocalCartUsecase deleteItemFromLocalCartUsecase;
  final DeleteLocalCartUsecase deleteLocalCartUsecase;
  final GetLocalCartUsecase getLocalCartUsecase;
  LocalCartCubit(
      {required this.addToLocalCartUsecase,
      required this.deleteItemFromLocalCartUsecase,
      required this.deleteLocalCartUsecase,
      required this.getLocalCartUsecase,
      required this.updateFromLocalCartUsecase})
      : super(LocalCartInitial());

  void addToLocalCart({required CartProduct cartProduct}) async {
    emit(LocalCartLoadingState());
    final result = await addToLocalCartUsecase(cartProduct: cartProduct);
    result.fold((l) => emit(LocalCartErrorState(message: l.message)),
        (r) => emit(LocalCartLoadedState()));
  }

  void updateLocalCartItem(
      {required CartProduct cartProduct, required int index}) async {
    emit(LocalCartLoadingState());
    final result = await updateFromLocalCartUsecase(
        cartProduct: cartProduct, index: index);
    result.fold((l) => emit(LocalCartErrorState(message: l.message)),
        (r) => emit(LocalCartLoadedState()));
  }

  void deleteItemFromLocalCart({required int index}) async {
    emit(LocalCartLoadingState());
    final result = await deleteItemFromLocalCartUsecase(index: index);
    result.fold((l) => emit(LocalCartErrorState(message: l.message)),
        (r) => emit(LocalCartLoadedState()));
  }

  void deleteLocalCart() async {
    emit(LocalCartLoadingState());
    final result = await deleteLocalCartUsecase();
    result.fold((l) => emit(LocalCartErrorState(message: l.message)),
        (r) => emit(LocalCartLoadedState()));
  }

  void getLocalCart() async {
    emit(LocalCartLoadingState());
    final result = await getLocalCartUsecase();
    result.fold((l) => emit(LocalCartErrorState(message: l.message)),
        (r) => emit(LocalCartGetedState(localCart: r)));
  }
}
