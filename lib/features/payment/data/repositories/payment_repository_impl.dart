import 'package:dartz/dartz.dart';
import 'package:shop/core/enum/payment_enum.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/auth/domain/entities/user.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/payment/data/datasources/cart_payment.dart';
import 'package:shop/features/payment/data/datasources/paypal_payment.dart';
import 'package:shop/features/payment/data/datasources/wallet_payment.dart';
import 'package:shop/features/payment/domain/entities/paying.dart';
import 'package:shop/features/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  @override
  Future<Either<Failure, String>> pay(Paying paying) async {
    try {
      String result = '';
      if (paying.paymentType == PaymentEnum.card) {
        result = await CardPayment().pay(amount: paying.price, currency: 'EGP');
      } else if (paying.paymentType == PaymentEnum.wallet) {
        result =
            await WalletPayment().pay(amount: paying.price, currency: 'EGP');
      } else if (paying.paymentType == PaymentEnum.paypal) {
        result =
            await PaypalPayment().pay(amount: paying.price, currency: 'EGP');
      } else {
        return Left(ServerFailure(
            message:
                "The ways to pay are only cart, phone wallet and paypal "));
      }
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
