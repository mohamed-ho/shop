import 'package:shop/features/cart/domain/entities/card_product.dart';

class CartProductModel extends CartProduct {
  CartProductModel({required super.productId, required super.quantity});
  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
        productId: json["productId"], quantity: json['quantity']);
  }
  toJson() {
    return {"productId": productId, "quantity": quantity};
  }

  factory CartProductModel.fromCartProduct(CartProduct cartProduct) {
    return CartProductModel(
        productId: cartProduct.productId, quantity: cartProduct.quantity);
  }
}
