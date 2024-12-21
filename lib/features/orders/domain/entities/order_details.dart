import 'package:shop/features/orders/domain/entities/cart_user.dart';
import 'package:shop/features/orders/domain/entities/order_product.dart';

class OrderDetails {
  int cartId;
  DateTime date;
  CartUser user;
  List<OrderProduct> orderProduct;
  double totalPrice;
  bool isShipped;
  OrderDetails(
      {required this.cartId,
      required this.date,
      required this.orderProduct,
      required this.totalPrice,
      required this.user,
      required this.isShipped});
}
