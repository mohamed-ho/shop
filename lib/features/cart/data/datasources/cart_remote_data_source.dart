

import 'package:shop/core/constant/end_points.dart';
import 'package:shop/core/server_service/server_service.dart';
import 'package:shop/features/cart/data/models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<List<CartModel>> getAllCarts();
  Future<CartModel> getSingleCart(int id);
  Future<List<CartModel>> getLimitCarts(int numberOfCarts);
  Future<List<CartModel>> getCartsinDateRange(DateTime start, DateTime end);
  Future<void> addNewCart(CartModel cart);
  Future<void> updateCart(CartModel cart);
  Future<void> deleteCart(int id);
  Future<List<CartModel>> getCartsOfMeanUser(int userId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ServerService serverService;

  CartRemoteDataSourceImpl({required this.serverService});

  @override
  Future<void> addNewCart(CartModel cart) async {
    await serverService.post(url: EndPoints.addCartUrl, data: cart.toJson());
  }

  @override
  Future<void> deleteCart(int id) async {
    await serverService.patch(url: EndPoints.deleteCartUrl(id: id));
  }

  @override
  Future<List<CartModel>> getAllCarts() async {
    final result = await serverService.get(url: EndPoints.getAllCartUrl);
    return List<CartModel>.from(result.map((e) => CartModel.fromJson(e)));
  }

  @override
  Future<List<CartModel>> getCartsOfMeanUser(int userId) async {
    final result = await serverService.get(
        url: EndPoints.getCartOfMeanUserUrl(userId: userId));
    return List<CartModel>.from(result.map((e) => CartModel.fromJson(e)));
  }

  @override
  Future<List<CartModel>> getCartsinDateRange(
      DateTime start, DateTime end) async {
    final result = await serverService.get(
        url: EndPoints.getCartInRangeDateUrl(start: start, end: end));
    return List<CartModel>.from(result.map((e) => CartModel.fromJson(e)));
  }

  @override
  Future<List<CartModel>> getLimitCarts(int numberOfCarts) async {
    final result = await serverService.get(
        url: EndPoints.getLimitCartUrl(numberOrProduct: numberOfCarts));
    return List<CartModel>.from(result.map((e) => CartModel.fromJson(e)));
  }

  @override
  Future<CartModel> getSingleCart(int id) async {
    final result =
        await serverService.get(url: EndPoints.getSingleCartUrl(id: id));
    return CartModel.fromJson(result);
  }

  @override
  Future<void> updateCart(CartModel cart) async {
    await serverService.put(
        url: EndPoints.updateCartUrl(id: cart.id), data: cart.toJson());
  }
}
