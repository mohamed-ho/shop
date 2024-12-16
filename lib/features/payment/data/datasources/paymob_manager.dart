import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop/core/constant/paymob_keys.dart';
import 'package:shop/core/failure/failure.dart';

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
        print(
            'failed to authenticate with paymob==================================================');
        throw Exception(
            ServerFailure(message: "failed to authenticate with paymob "));
      }
    } catch (e) {
      print(
          'failed to authenticate with paymob==================================================');
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
        print(
            'Failed to create order==================================================${response.statusCode}');
        throw Exception(ServerFailure(message: "Failed to create order"));
      }
    } catch (e) {
      print(
          'Failed to create order==================================================${e.toString()}');
      throw Exception(ServerFailure(message: "Failed to create order"));
    }
  }

  static Future<String> generatePaymentKey(
      {required double amount,
      String currency = "EGP",
      required int integrationId}) async {
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
            'first_name': 'John',
            'last_name': 'Doe',
            'phone_number': '+201234567890',
            'email': 'john.doe@example.com',
            "apartment": "NA",
            "floor": "NA",
            "street": "NA",
            "building": "NA",
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "state": "NA"
          },
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data['token']; // Payment key
      } else {
        print(
            'Failed to generate payment key==================================================${response.statusCode}');
        throw Exception(
            ServerFailure(message: 'Failed to generate payment key'));
      }
    } catch (e) {
      print(
          'Failed to generate payment key==================================================${e.toString()}');
      throw Exception(ServerFailure(message: 'Failed to generate payment key'));
    }
  }
}
