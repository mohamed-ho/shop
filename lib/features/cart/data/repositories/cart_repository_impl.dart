import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:shop/features/cart/data/models/cart_model.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});
  @override
  Future<Either<Failure, void>> addNewCartItem(Cart cartItem) async {
    try {
      final result =
          await cartRemoteDataSource.addNewCart(CartModel.fromCart(cartItem));
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> deleteCartItem(int cartItemId) async {
    try {
      final result = await cartRemoteDataSource.deleteCart(cartItemId);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<Cart>>> getAllCartItem() async {
    try {
      final result = await cartRemoteDataSource.getAllCarts();
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<Cart>>> getCartItemsInDateRange(
      DateTime start, DateTime end) async {
    try {
      final result = await cartRemoteDataSource.getCartsinDateRange(start, end);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<Cart>>> getCartItemsOfMeanUser(int userId) async {
    try {
      print(
          'you are here please check you id $id=================================');
      final result = await cartRemoteDataSource.getCartsOfMeanUser(userId);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Cart>> getSingleCartItem(int id) async {
    try {
      final result = await cartRemoteDataSource.getSingleCart(id);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<Cart>>> getUserCartsInRangeDate(
      int userId, DateTime start, DateTime end) async {
    try {
      final result =
          await cartRemoteDataSource.getUserCartInRangeDate(userId, start, end);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
