import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/domain/repositories/cart_repository.dart';

class GetAllCartItemsUsecase {
  final CartRepository cartRepository;

  GetAllCartItemsUsecase({required this.cartRepository});
  Future<Either<Failure, List<Cart>>> call() async {
    return await cartRepository.getAllCartItem();
  }
}
