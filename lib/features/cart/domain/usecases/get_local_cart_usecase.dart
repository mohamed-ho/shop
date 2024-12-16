import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/domain/repositories/local_cart_repository.dart';

class GetLocalCartUsecase {
  final LocalCartRepository localCartRepository;

  GetLocalCartUsecase({required this.localCartRepository});
  Future<Either<Failure, Cart?>> call() async {
    return localCartRepository.getLocalCart();
  }
}
