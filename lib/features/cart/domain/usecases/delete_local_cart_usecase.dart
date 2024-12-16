import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/repositories/local_cart_repository.dart';

class DeleteLocalCartUsecase {
  final LocalCartRepository localCartRepository;
  DeleteLocalCartUsecase({required this.localCartRepository});
  Future<Either<Failure, void>> call() async {
    return localCartRepository.deleteLocalCart();
  }
}
