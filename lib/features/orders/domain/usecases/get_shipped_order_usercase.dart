import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';

import 'package:shop/features/orders/domain/entities/order_cart.dart';
import 'package:shop/features/orders/domain/repositories/order_repository.dart';

class GetShippedOrderUsercase {
  final OrderRepository orderRepository;

  GetShippedOrderUsercase({required this.orderRepository});
  Future<Either<Failure, List<OrderCart>>> call() async {
    return orderRepository.getShippedOrder();
  }
}
