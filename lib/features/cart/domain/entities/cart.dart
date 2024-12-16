
import 'package:shop/features/cart/domain/entities/card_product.dart';

class Cart {
  final int id;
  final int userId;
  final DateTime date;
  final List<CartProduct> cartProducts;

  Cart(
      {required this.id,
      required this.userId,
      required this.date,
      required this.cartProducts});
}
