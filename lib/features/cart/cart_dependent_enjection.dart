import 'package:shop/dependent_enjection.dart';

import 'package:shop/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:shop/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:shop/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:shop/features/cart/data/repositories/local_cart_repository_impl.dart';
import 'package:shop/features/cart/domain/repositories/cart_repository.dart';
import 'package:shop/features/cart/domain/repositories/local_cart_repository.dart';
import 'package:shop/features/cart/domain/usecases/add_new_cart_item_usecase.dart';
import 'package:shop/features/cart/domain/usecases/add_to_local_cart_usecase.dart';
import 'package:shop/features/cart/domain/usecases/delete_cart_item_usecase.dart';
import 'package:shop/features/cart/domain/usecases/delete_item_from_local_cart_usecase.dart';
import 'package:shop/features/cart/domain/usecases/delete_local_cart_usecase.dart';
import 'package:shop/features/cart/domain/usecases/get_all_cart_items_usecase.dart';
import 'package:shop/features/cart/domain/usecases/get_cart_items_in_date_range_usecase.dart';
import 'package:shop/features/cart/domain/usecases/get_cart_items_of_mean_user_usecase.dart';

import 'package:shop/features/cart/domain/usecases/get_local_cart_usecase.dart';
import 'package:shop/features/cart/domain/usecases/get_single_cart_item_usecase.dart';
import 'package:shop/features/cart/domain/usecases/get_user_carts_in_range_date.dart';

import 'package:shop/features/cart/domain/usecases/update_from_local_cart_usecase.dart';
import 'package:shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:shop/features/cart/presentation/cubit/cubit/local_cart_cubit.dart';

class CartDependentEnjection {
  init() {
    ls.registerFactory(() => CartCubit(
          addNewCartItemUsecase: ls(),
          deleteCartItemUsecase: ls(),
          getAllCartItemsUsecase: ls(),
          getCartItemsInDateRangeUsecase: ls(),
          getCartItemsOfMeanUserUsecase: ls(),
          getUserCartsInRangeDate: ls(),
          getSingleCartItemUsecase: ls(),
        ));
    ls.registerFactory(() => LocalCartCubit(
        addToLocalCartUsecase: ls(),
        deleteItemFromLocalCartUsecase: ls(),
        deleteLocalCartUsecase: ls(),
        getLocalCartUsecase: ls(),
        updateFromLocalCartUsecase: ls()));

    ls.registerLazySingleton(() => AddNewCartItemUsecase(cartRepository: ls()));
    ls.registerLazySingleton(() => DeleteCartItemUsecase(cartRepository: ls()));
    ls.registerLazySingleton(
        () => GetAllCartItemsUsecase(cartRepository: ls()));
    ls.registerLazySingleton(
        () => GetCartItemsInDateRangeUsecase(cartRepository: ls()));
    ls.registerLazySingleton(
        () => GetCartItemsOfMeanUserUsecase(cartRepository: ls()));
    ls.registerLazySingleton(
        () => GetUserCartsInRangeDate(cartRepository: ls()));
    ls.registerLazySingleton(
        () => GetSingleCartItemUsecase(cartRepository: ls()));
    ls.registerLazySingleton(
        () => AddToLocalCartUsecase(localCartRepository: ls()));
    ls.registerLazySingleton(
        () => DeleteItemFromLocalCartUsecase(localCartRepository: ls()));
    ls.registerLazySingleton(
        () => DeleteLocalCartUsecase(localCartRepository: ls()));
    ls.registerLazySingleton(
        () => GetLocalCartUsecase(localCartRepository: ls()));
    ls.registerLazySingleton(
        () => UpdateFromLocalCartUsecase(localCartRepository: ls()));

    ls.registerLazySingleton<CartRepository>(
        () => CartRepositoryImpl(cartRemoteDataSource: ls()));
    ls.registerLazySingleton<LocalCartRepository>(
        () => LocalCartRepositoryImpl(cartLocalDataSource: ls()));

    ls.registerLazySingleton<CartRemoteDataSource>(
        () => CartRemoteDataSourceImpl(serverService: ls()));
    ls.registerLazySingleton<CartLocalDataSource>(
        () => CartLocalDataSourceImpl(sharedPreferences: ls()));
  }
}
