import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/entities/card_product.dart';
import 'package:shop/features/cart/domain/repositories/local_cart_repository.dart';

class AddToLocalCartUsecase {
  final LocalCartRepository localCartRepository;

  AddToLocalCartUsecase({required this.localCartRepository});
  Future<Either<Failure, void>> call({required CartProduct cartProduct}) async {
    return localCartRepository.addToLocalCart(cartProduct);
  }
}
