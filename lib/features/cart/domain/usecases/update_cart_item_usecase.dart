import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/domain/repositories/cart_repository.dart';

class UpdateCartItemUsecase {
  final CartRepository cartRepository;

  UpdateCartItemUsecase({required this.cartRepository});
  Future<Either<Failure, void>> call(Cart cart) async {
    return await cartRepository.updateCartItem(cart);
  }
}
