import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';

import 'package:shop/features/orders/domain/entities/order_details.dart';
import 'package:shop/features/orders/domain/repositories/order_repository.dart';

class GetOrderDetailsUsercase {
  final OrderRepository orderRepository;

  GetOrderDetailsUsercase({required this.orderRepository});
  Future<Either<Failure, OrderDetails>> call(int cartId) async {
    return orderRepository.getOrderDetails(cartId);
  }
}
