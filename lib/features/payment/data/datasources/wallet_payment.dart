// Implementation for phone wallet payment
import 'package:shop/core/constant/paymob_keys.dart';
import 'package:shop/features/auth/domain/entities/user.dart';
import 'package:shop/features/payment/data/datasources/payment.dart';
import 'package:shop/features/payment/data/datasources/paymob_manager.dart';

class WalletPayment implements Payment {
  @override
  Future<String> pay(
      {required double amount,
      required String currency,
      required User user}) async {
    final value = await PaymobManager.generatePaymentKey(
        amount: amount,
        integrationId: PaymobKeys.walletIntegretedId,
        user: user);

    return "https://accept.paymob.com/api/acceptance/iframes/887861?payment_token=$value";
  }
}
