import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:shop/features/cart/data/models/cart_product_model.dart';
import 'package:shop/features/cart/domain/entities/card_product.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/domain/repositories/local_cart_repository.dart';

class LocalCartRepositoryImpl implements LocalCartRepository {
  final CartLocalDataSource cartLocalDataSource;

  LocalCartRepositoryImpl({required this.cartLocalDataSource});
  @override
  Future<Either<Failure, void>> addToLocalCart(CartProduct cartProduct) async {
    try {
      final result = await cartLocalDataSource
          .addToLocalCart(CartProductModel.fromCartProduct(cartProduct));
      return Right(result);
    } on CachFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> deleteItemFromLocalCart(int index) async {
    try {
      final result = await cartLocalDataSource.deleteItemFromLocalCart(index);
      return Right(result);
    } on CachFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> deleteLocalCart() async {
    try {
      final result = await cartLocalDataSource.deleteLocalCart();
      return Right(result);
    } on CachFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Either<Failure, Cart?> getLocalCart() {
    try {
      final result = cartLocalDataSource.getLocalCart();
      return Right(result);
    } on CachFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> updateFromLocalCart(
      CartProduct cartProduct, int index) async {
    try {
      final result = await cartLocalDataSource.update(
          CartProductModel.fromCartProduct(cartProduct), index);
      return Right(result);
    } on CachFailure catch (e) {
      return Left(e);
    }
  }
}
