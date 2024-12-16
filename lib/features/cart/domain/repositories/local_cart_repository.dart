import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/entities/card_product.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';

abstract class LocalCartRepository {
  Either<Failure, Cart?> getLocalCart();
  Future<Either<Failure, void>> addToLocalCart(CartProduct cartProduct);
  Future<Either<Failure, void>> updateFromLocalCart(
      CartProduct cartProduct, int index);
  Future<Either<Failure, void>> deleteItemFromLocalCart(int index);
  Future<Either<Failure, void>> deleteLocalCart();
}
