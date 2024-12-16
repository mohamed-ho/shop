import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/domain/repositories/cart_repository.dart';

class GetCartItemsOfMeanUserUsecase {
  final CartRepository cartRepository;

  GetCartItemsOfMeanUserUsecase({required this.cartRepository});
  Future<Either<Failure, List<Cart>>> call(int userId) async {
    return await cartRepository.getCartItemsOfMeanUser(userId);
  }
}
