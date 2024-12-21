import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/orders/data/datasources/oreder_remote_data_source.dart';
import 'package:shop/features/orders/domain/entities/order_cart.dart';
import 'package:shop/features/orders/domain/entities/order_details.dart';
import 'package:shop/features/orders/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrederRemoteDataSource orederRemoteDataSource;

  OrderRepositoryImpl({required this.orederRemoteDataSource});
  @override
  Future<Either<Failure, List<OrderCart>>> getShippedOrder() async {
    try {
      final result = await orederRemoteDataSource.getShippedOrder();
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<OrderCart>>> getUnShippedOrder() async {
    try {
      final result = await orederRemoteDataSource.getUnShippedOrder();
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> shipeOrder(int id) async {
    try {
      final result = await orederRemoteDataSource.shipeOrder(id);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, OrderDetails>> getOrderDetails(int orderCartId) async {
    try {
      final result = await orederRemoteDataSource.getOrderdetails(orderCartId);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
