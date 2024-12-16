import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/repositories/cart_repository.dart';

class DeleteCartItemUsecase {
  final CartRepository cartRepository;

  DeleteCartItemUsecase({required this.cartRepository});
  Future<Either<Failure, void>> call(int cartItemId) async {
    return await cartRepository.deleteCartItem(cartItemId);
  }
}
