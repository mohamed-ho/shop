import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/orders/domain/repositories/order_repository.dart';

class ShipeOrderUsecase {
  final OrderRepository orderRepository;

  ShipeOrderUsecase({required this.orderRepository});
  Future<Either<Failure, void>> call(int id) async {
    return orderRepository.shipeOrder(id);
  }
}
