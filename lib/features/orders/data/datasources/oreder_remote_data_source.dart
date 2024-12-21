import 'package:shop/core/constant/end_points.dart';
import 'package:shop/core/server_service/http_service.dart';

import 'package:shop/features/orders/data/models/order_cart_model.dart';
import 'package:shop/features/orders/data/models/order_details_model.dart';

abstract class OrederRemoteDataSource {
  Future<List<OrderCartModel>> getShippedOrder();
  Future<List<OrderCartModel>> getUnShippedOrder();
  Future<void> shipeOrder(int id);
  Future<OrderDetailsModel> getOrderdetails(int cartId);
}

class OrederRemoteDataSourceImpl implements OrederRemoteDataSource {
  final HttpService httpService;

  OrederRemoteDataSourceImpl({required this.httpService});
  @override
  Future<List<OrderCartModel>> getShippedOrder() async {
    final result = await httpService.get(url: EndPoints.getShippedOrderUrl);
    return List<OrderCartModel>.from(
        result.map((e) => OrderCartModel.fromJson(e)));
  }

  @override
  Future<List<OrderCartModel>> getUnShippedOrder() async {
    final result = await httpService.get(url: EndPoints.getUnShippedOrderUrl);

    return List<OrderCartModel>.from(
        result.map((e) => OrderCartModel.fromJson(e)));
  }

  @override
  Future<void> shipeOrder(int id) async {
    await httpService.post(url: EndPoints.shipeOrderUrl, data: {"id": id});
  }

  @override
  Future<OrderDetailsModel> getOrderdetails(int cartId) async {
    final result = await httpService
        .post(url: EndPoints.getOrderDetailsUrl, data: {"cart_id": cartId});
    return OrderDetailsModel.fromJson(result);
  }
}
