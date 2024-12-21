import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/orders/domain/entities/order_cart.dart';
import 'package:shop/features/orders/domain/repositories/order_repository.dart';

class GetUnShippedOrderUsecase {
  final OrderRepository orderRepository;

  GetUnShippedOrderUsecase({required this.orderRepository});
  Future<Either<Failure, List<OrderCart>>> call() async {
    return orderRepository.getUnShippedOrder();
  }
}
