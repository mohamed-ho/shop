import 'package:shop/features/orders/domain/entities/cart_user.dart';

class CartUserModel extends CartUser {
  CartUserModel(
      {required super.address,
      required super.email,
      required super.name,
      required super.phone});

  factory CartUserModel.fromJson(Map<String, dynamic> json) {
    return CartUserModel(
        address: json['address'],
        email: json['email'],
        name: json['name'],
        phone: json['phone']);
  }

  factory CartUserModel.fromCartUser(CartUser cartUser) {
    return CartUserModel(
        address: cartUser.address,
        email: cartUser.email,
        name: cartUser.name,
        phone: cartUser.phone);
  }
}
