import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/domain/usecases/add_new_cart_item_usecase.dart';
import 'package:shop/features/cart/domain/usecases/delete_cart_item_usecase.dart';
import 'package:shop/features/cart/domain/usecases/get_all_cart_items_usecase.dart';
import 'package:shop/features/cart/domain/usecases/get_cart_items_in_date_range_usecase.dart';
import 'package:shop/features/cart/domain/usecases/get_cart_items_of_mean_user_usecase.dart';
import 'package:shop/features/cart/domain/usecases/get_user_carts_in_range_date.dart';
import 'package:shop/features/cart/domain/usecases/get_single_cart_item_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final AddNewCartItemUsecase addNewCartItemUsecase;
  final DeleteCartItemUsecase deleteCartItemUsecase;
  final GetAllCartItemsUsecase getAllCartItemsUsecase;
  final GetCartItemsInDateRangeUsecase getCartItemsInDateRangeUsecase;
  final GetCartItemsOfMeanUserUsecase getCartItemsOfMeanUserUsecase;
  final GetSingleCartItemUsecase getSingleCartItemUsecase;
  final GetUserCartsInRangeDate getUserCartsInRangeDate;
  CartCubit(
      {required this.addNewCartItemUsecase,
      required this.deleteCartItemUsecase,
      required this.getAllCartItemsUsecase,
      required this.getCartItemsInDateRangeUsecase,
      required this.getCartItemsOfMeanUserUsecase,
      required this.getSingleCartItemUsecase,
      required this.getUserCartsInRangeDate})
      : super(CartInitial());

  Future<void> addNewCart(Cart cart) async {
    emit(CartLoadingState());
    final result = await addNewCartItemUsecase(cart);
    result.fold((l) => emit(CartErrorState(message: l.message)),
        (r) => emit(CartLoadedState()));
  }

  void getUserCartsInRange(int userId, DateTime start, DateTime end) async {
    emit(CartLoadingState());
    final result = await getUserCartsInRangeDate(userId, start, end);
    result.fold((l) => emit(CartErrorState(message: l.message)),
        (r) => emit(CartLoadedState()));
  }

  void deleteCart(int cartId) async {
    emit(CartLoadingState());
    final result = await deleteCartItemUsecase(cartId);
    result.fold((l) => emit(CartErrorState(message: l.message)),
        (r) => emit(CartLoadedState()));
  }

  void getAllCarts() async {
    emit(CartLoadingState());
    final result = await getAllCartItemsUsecase();
    result.fold((l) => emit(CartErrorState(message: l.message)),
        (r) => emit(CartGetedCartsState(carts: r)));
  }

  void getCartInRageDate(
      {required DateTime start, required DateTime end}) async {
    emit(CartLoadingState());
    final result = await getCartItemsInDateRangeUsecase(start, end);
    result.fold((l) => emit(CartErrorState(message: l.message)),
        (r) => emit(CartGetedCartsState(carts: r)));
  }

  void getCartOfMeanUser({required int userId}) async {
    emit(CartLoadingState());
    final result = await getCartItemsOfMeanUserUsecase(userId);
    result.fold((l) => emit(CartErrorState(message: l.message)),
        (r) => emit(CartGetedCartsState(carts: r)));
  }

  void getSingleCart({required int cartId}) async {
    emit(CartLoadingState());
    final result = await getSingleCartItemUsecase(cartId);
    result.fold((l) => emit(CartErrorState(message: l.message)),
        (r) => emit(CartGetedSingleCartState(cart: r)));
  }
}
