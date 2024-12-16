import 'package:shop/features/cart/data/models/cart_product_model.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';

class CartModel extends Cart {
  CartModel(
      {required super.id,
      required super.userId,
      required super.date,
      required super.cartProducts});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        id: json['id'],
        userId: json['userId'],
        date: DateTime.parse(json['date']),
        cartProducts: List<CartProductModel>.from(
            json['products'].map((e) => CartProductModel.fromJson(e))));
  }

  factory CartModel.fromCart(Cart cart) {
    return CartModel(
        id: cart.id,
        userId: cart.userId,
        date: cart.date,
        cartProducts: cart.cartProducts);
  }

  toJson() {
    return {
      "id": id,
      "userId": userId,
      "date": date.toIso8601String(),
      "products": List<Map<String, dynamic>>.from(
          cartProducts.map((e) => CartProductModel.fromCartProduct(e).toJson()))
    };
  }
}
