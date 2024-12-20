import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop/core/constant/paymob_keys.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/auth/domain/entities/user.dart';

abstract class PaymobManager {
  static Future<String> _authenticate() async {
    try {
      final response = await http.post(
        Uri.parse('https://accept.paymob.com/api/auth/tokens'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'api_key': PaymobKeys.apiKey}),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data['token'];
      } else {
        throw Exception(
            ServerFailure(message: "failed to authenticate with paymob "));
      }
    } catch (e) {
      throw Exception(
          ServerFailure(message: "failed to authenticate with paymob "));
    }
  }

  static Future<String> _createOrder(
      {required double amount, String currency = 'EGP'}) async {
    try {
      final response = await http.post(
        Uri.parse('https://accept.paymob.com/api/ecommerce/orders'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'auth_token': await _authenticate(),
          'amount_cents': (amount * 100).toInt(),
          'currency': currency,
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data['id'].toString(); // Order ID
      } else {
        throw Exception(ServerFailure(message: "Failed to create order"));
      }
    } catch (e) {
      throw Exception(ServerFailure(message: "Failed to create order"));
    }
  }

  static Future<String> generatePaymentKey(
      {required double amount,
      String currency = "EGP",
      required int integrationId,
      required User user}) async {
    try {
      final response = await http.post(
        Uri.parse('https://accept.paymob.com/api/acceptance/payment_keys'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'auth_token': await _authenticate(),
          'amount_cents': (amount * 100).toInt(),
          "expiration": 3600,
          "integration_id": integrationId,
          'currency': 'EGP',
          'order_id': await _createOrder(amount: amount, currency: currency),
          'billing_data': {
            'first_name': user.name.firstName,
            'last_name': user.name.lastName,
            'phone_number': user.phone,
            'email': user.email,
            "apartment": "NA",
            "floor": "NA",
            "street": user.address.street,
            "building": user.address.number,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": user.address.city,
            "country": "NA",
            "state": "NA"
          },
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data['token']; // Payment key
      } else {
        throw Exception(
            ServerFailure(message: 'Failed to generate payment key'));
      }
    } catch (e) {
      throw Exception(ServerFailure(message: 'Failed to generate payment key'));
    }
  }
}
