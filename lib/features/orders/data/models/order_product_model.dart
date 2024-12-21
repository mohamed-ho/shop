import 'package:shop/features/orders/domain/entities/order_product.dart';

class OrderProductModel extends OrderProduct {
  OrderProductModel(
      {required super.description,
      required super.id,
      required super.image,
      required super.price,
      required super.quantity,
      required super.title,
      required super.totalPrice});

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
        description: json['description'],
        id: json['id'],
        image: json['image'],
        price: double.parse(json['price']),
        quantity: json['quantity'],
        title: json['title'],
        totalPrice: double.parse(json['total_price']));
  }

  factory OrderProductModel.fromOrderProduct(OrderProduct orderProduct) {
    return OrderProductModel(
        description: orderProduct.description,
        id: orderProduct.id,
        image: orderProduct.image,
        price: orderProduct.price,
        quantity: orderProduct.quantity,
        title: orderProduct.title,
        totalPrice: orderProduct.totalPrice);
  }
}
