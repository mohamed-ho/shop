import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/orders/domain/entities/order_cart.dart';

class OrderCartModel extends OrderCart {
  OrderCartModel({
    required super.id,
    required super.userId,
    required super.date,
  });

  factory OrderCartModel.fromJson(Map<String, dynamic> json) {
    return OrderCartModel(
      id: json['id'],
      userId: json['user_id'],
      date: DateTime.parse(json['date']),
    );
  }

  factory OrderCartModel.fromCart(Cart cart) {
    return OrderCartModel(
      id: cart.id,
      userId: cart.userId,
      date: cart.date,
    );
  }

  toJson() {
    return {
      "id": id,
      "userId": userId,
      "date": date.toIso8601String(),
    };
  }
}
