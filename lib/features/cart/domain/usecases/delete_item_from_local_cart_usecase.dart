import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';

import 'package:shop/features/cart/domain/repositories/local_cart_repository.dart';

class DeleteItemFromLocalCartUsecase {
  final LocalCartRepository localCartRepository;

  DeleteItemFromLocalCartUsecase({required this.localCartRepository});
  Future<Either<Failure, void>> call({required int index}) async {
    return localCartRepository.deleteItemFromLocalCart(index);
  }
}
