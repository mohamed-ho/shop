import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/domain/repositories/cart_repository.dart';

class GetCartItemsInDateRangeUsecase {
  final CartRepository cartRepository;

  GetCartItemsInDateRangeUsecase({required this.cartRepository});
  Future<Either<Failure, List<Cart>>> call(DateTime start, DateTime end) async {
    return await cartRepository.getCartItemsInDateRange(start, end);
  }
}
