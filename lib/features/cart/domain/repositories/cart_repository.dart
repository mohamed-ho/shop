import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Cart>>> getAllCartItem();
  Future<Either<Failure, Cart>> getSingleCartItem(int id);
  Future<Either<Failure, List<Cart>>> getLimitCartItem(int numberOfCartItem);
  Future<Either<Failure, List<Cart>>> getCartItemsInDateRange(
      DateTime start, DateTime end);
  Future<Either<Failure, void>> addNewCartItem(Cart cartItem);
  Future<Either<Failure, void>> updateCartItem(Cart cartItem);
  Future<Either<Failure, void>> deleteCartItem(int cartItemId);
  Future<Either<Failure, List<Cart>>> getCartItemsOfMeanUser(int userId);
}
