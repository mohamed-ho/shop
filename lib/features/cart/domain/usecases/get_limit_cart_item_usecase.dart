import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/domain/repositories/cart_repository.dart';

class GetLimitCartItemUsecase {
  final CartRepository cartRepository;

  GetLimitCartItemUsecase({required this.cartRepository});
  Future<Either<Failure, List<Cart>>> call(int numberOfCartItem) async {
    return await cartRepository.getLimitCartItem(numberOfCartItem);
  }
}
