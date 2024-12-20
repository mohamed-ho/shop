import 'dart:convert';
import 'dart:typed_data';

import 'package:shop/core/failure/exception_handler.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/core/server_service/server_service.dart';
import 'package:http/http.dart' as http;

class HttpService implements ServerService {
  @override
  Future<dynamic> get(
      {required String url, Map<String, String>? header}) async {
    try {
      final response = await http.get(Uri.parse(url), headers: header);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ServerFailure(message: jsonDecode(response.body)['message']);
      }
    } catch (e) {
      throw ServerFailure(message: ExceptionHandler.getErrorMessage(e));
    }
  }

  @override
  Future<dynamic> patch(
      {required String url,
      Map<String, dynamic>? data,
      Map<String, String>? header}) async {
    try {
      final response =
          await http.patch(Uri.parse(url), headers: header, body: data);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ServerFailure(message: jsonDecode(response.body)['message']);
      }
    } catch (e) {
      throw ServerFailure(message: ExceptionHandler.getErrorMessage(e));
    }
  }

  @override
  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, String>? header}) async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: header, body: jsonEncode(data));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ServerFailure(message: jsonDecode(response.body)['message']);
      }
    } catch (e) {
      throw ServerFailure(message: ExceptionHandler.getErrorMessage(e));
    }
  }

  @override
  Future<dynamic> put(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, String>? header}) async {
    try {
      final response = await http.put(Uri.parse(url),
          body: jsonEncode(data), headers: header);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ServerFailure(message: jsonDecode(response.body)['message']);
      }
    } catch (e) {
      throw ServerFailure(message: ExceptionHandler.getErrorMessage(e));
    }
  }
}
