import 'package:shop/features/orders/data/models/cart_user_model.dart';
import 'package:shop/features/orders/data/models/order_product_model.dart';
import 'package:shop/features/orders/domain/entities/order_details.dart';
import 'package:shop/features/orders/domain/entities/order_product.dart';

class OrderDetailsModel extends OrderDetails {
  OrderDetailsModel(
      {required super.cartId,
      required super.date,
      required super.orderProduct,
      required super.totalPrice,
      required super.user,
      required super.isShipped});

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
        cartId: json['cart_id'],
        isShipped: json['shipped'] == 1 ? true : false,
        date: DateTime.parse(
          json['date'],
        ),
        orderProduct: List<OrderProduct>.from(
            json["products"].map((e) => OrderProductModel.fromJson(e))),
        totalPrice: double.parse(json['all_total_price'].toString()),
        user: CartUserModel.fromJson(
          json['User'],
        ));
  }

  factory OrderDetailsModel.fromORderDetails(OrderDetails orderDetails) {
    return OrderDetailsModel(
        cartId: orderDetails.cartId,
        date: orderDetails.date,
        orderProduct: orderDetails.orderProduct,
        totalPrice: orderDetails.totalPrice,
        user: orderDetails.user,
        isShipped: orderDetails.isShipped);
  }
}
