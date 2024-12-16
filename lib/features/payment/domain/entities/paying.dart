import 'package:shop/core/enum/payment_enum.dart';
import 'package:shop/features/auth/domain/entities/user.dart';
import 'package:shop/features/home/data/models/product_model.dart';

class Paying {
  double price;
  List<ProductModal> products;
  User user;
  PaymentEnum paymentType;

  Paying(
      {required this.price,
      required this.products,
      required this.user,
      required this.paymentType});
}
