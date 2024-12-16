// Implementation for card payment
import 'package:shop/core/constant/paymob_keys.dart';
import 'package:shop/features/payment/data/datasources/payment.dart';
import 'package:shop/features/payment/data/datasources/paymob_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class CardPayment implements Payment {
  @override
  Future<String> pay({required double amount, required String currency}) async {
    final value = await PaymobManager.generatePaymentKey(
        amount: amount, integrationId: PaymobKeys.cardIntegretedId);

    return "https://accept.paymob.com/api/acceptance/iframes/887855?payment_token=$value";
  }
}