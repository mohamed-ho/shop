import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/entities/card_product.dart';
import 'package:shop/features/cart/domain/repositories/local_cart_repository.dart';

class UpdateFromLocalCartUsecase {
  final LocalCartRepository localCartRepository;

  UpdateFromLocalCartUsecase({required this.localCartRepository});
  Future<Either<Failure, void>> call(
      {required CartProduct cartProduct, required int index}) async {
    return localCartRepository.updateFromLocalCart(cartProduct, index);
  }
}
