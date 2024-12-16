import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/domain/repositories/cart_repository.dart';

class GetSingleCartItemUsecase {
  final CartRepository cartRepository;

  GetSingleCartItemUsecase({required this.cartRepository});
  Future<Either<Failure, Cart>> call(int cartId) async {
    return await cartRepository.getSingleCartItem(cartId);
  }
}
