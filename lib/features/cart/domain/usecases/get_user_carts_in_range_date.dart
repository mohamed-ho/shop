import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/domain/repositories/cart_repository.dart';

class GetUserCartsInRangeDate {
  final CartRepository cartRepository;

  GetUserCartsInRangeDate({required this.cartRepository});
  Future<Either<Failure, List<Cart>>> call(
      int userId, DateTime start, DateTime end) async {
    return await cartRepository.getUserCartsInRangeDate(userId, start, end);
  }
}
