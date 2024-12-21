import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/orders/data/datasources/oreder_remote_data_source.dart';
import 'package:shop/features/orders/data/repositories/order_repository_impl.dart';
import 'package:shop/features/orders/domain/repositories/order_repository.dart';
import 'package:shop/features/orders/domain/usecases/get_order_details_usercase.dart';
import 'package:shop/features/orders/domain/usecases/get_shipped_order_usercase.dart';
import 'package:shop/features/orders/domain/usecases/get_un_shipped_order_usecase.dart';
import 'package:shop/features/orders/domain/usecases/shipe_order_usecase.dart';
import 'package:shop/features/orders/presentation/cubit/orders_cubit.dart';

class OrderEnjection {
  init() {
    ls.registerFactory(() => OrdersCubit(
        getShippedOrderUsercase: ls(),
        getUnShippedOrderUsecase: ls(),
        shipeOrderUsecase: ls(),
        getOrderDetailsUsercase: ls()));
    ls.registerLazySingleton(
        () => GetShippedOrderUsercase(orderRepository: ls()));
    ls.registerLazySingleton(
        () => GetUnShippedOrderUsecase(orderRepository: ls()));
    ls.registerLazySingleton(() => ShipeOrderUsecase(orderRepository: ls()));
    ls.registerLazySingleton(
        () => GetOrderDetailsUsercase(orderRepository: ls()));
    ls.registerLazySingleton<OrderRepository>(
        () => OrderRepositoryImpl(orederRemoteDataSource: ls()));
    ls.registerLazySingleton<OrederRemoteDataSource>(
        () => OrederRemoteDataSourceImpl(httpService: ls()));
  }
}
