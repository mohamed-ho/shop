import 'package:shop/core/constant/end_points.dart';
import 'package:shop/core/server_service/server_service.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:shop/features/cart/data/models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<List<CartModel>> getAllCarts();
  Future<CartModel> getSingleCart(int id);
  Future<List<CartModel>> getUserCartInRangeDate(
      int userId, DateTime start, DateTime end);
  Future<List<CartModel>> getCartsinDateRange(DateTime start, DateTime end);
  Future<void> addNewCart(CartModel cart);

  Future<void> deleteCart(int id);
  Future<List<CartModel>> getCartsOfMeanUser(int userId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ServerService serverService;

  CartRemoteDataSourceImpl({required this.serverService});

  @override
  Future<void> addNewCart(CartModel cart) async {
    await serverService.post(url: EndPoints.addCartUrl, data: cart.toJson());

    await ls<CartLocalDataSource>().deleteLocalCart();
  }

  @override
  Future<void> deleteCart(int id) async {
    await serverService
        .post(url: EndPoints.deleteCartUrl, data: {'cart_id': id});
  }

  @override
  Future<List<CartModel>> getAllCarts() async {
    final result = await serverService.get(url: EndPoints.getAllCartUrl);
    return List<CartModel>.from(result.map((e) => CartModel.fromJson(e)));
  }

  @override
  Future<List<CartModel>> getCartsOfMeanUser(int userId) async {
    final result = await serverService
        .post(url: EndPoints.getUserCartsUrl, data: {'user_id': userId});
    return List<CartModel>.from(result.map((e) => CartModel.fromJson(e)));
  }

  @override
  Future<List<CartModel>> getCartsinDateRange(
      DateTime start, DateTime end) async {
    final result = await serverService.post(
        url: EndPoints.getInDateRangeUrl, data: {'start': start, "end": end});
    return List<CartModel>.from(result.map((e) => CartModel.fromJson(e)));
  }

  @override
  Future<List<CartModel>> getUserCartInRangeDate(
      int userId, DateTime start, DateTime end) async {
    final result = await serverService.post(
        url: EndPoints.getUserCartsInRangeDate,
        data: {'user_id': userId, "start_date": start, "end_date": end});
    return List<CartModel>.from(result.map((e) => CartModel.fromJson(e)));
  }

  @override
  Future<CartModel> getSingleCart(int id) async {
    final result = await serverService
        .post(url: EndPoints.getSingleCartUrl, data: {'id': id});
    return CartModel.fromJson(result);
  }
}
