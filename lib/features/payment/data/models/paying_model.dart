import 'package:shop/features/payment/domain/entities/paying.dart';

class PayingModel extends Paying {
  PayingModel(
      {required super.price,
      required super.products,
      required super.user,
      required super.paymentType});
}
