import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/orders/domain/entities/order_cart.dart';
import 'package:shop/features/orders/domain/entities/order_details.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderCart>>> getShippedOrder();
  Future<Either<Failure, List<OrderCart>>> getUnShippedOrder();
  Future<Either<Failure, void>> shipeOrder(int id);
  Future<Either<Failure, OrderDetails>> getOrderDetails(int orderCartId);
}
