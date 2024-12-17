import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/core/constant/shared_preference_keys.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/auth/data/models/user_model.dart';
import 'package:shop/features/auth/domain/entities/user.dart';

abstract class AuthLocalDataSource {
  Future<void> saveLogin();
  bool isLogin();
  Future<void> addUserData(UserModel user);
  UserModel getUserData();
  Future<void> logout();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> addUserData(UserModel user) async {
    final result = await sharedPreferences.setString(
        SharedPreferenceKeys.userDataKey, jsonEncode(user.toJson()));
    if (!result) {
      throw Exception(CachFailure(message: 'error while saving user data'));
    }
  }

  @override
  UserModel getUserData() {
    final result =
        sharedPreferences.getString(SharedPreferenceKeys.userDataKey);
    print(
        '$result===================================================================');
    // if (result == null) {
    //   throw Exception(CachFailure(message: 'error while saving user data'));
    // } else {
    return UserModel.fromJson(jsonDecode(result!));
    //  }
  }

  @override
  bool isLogin() {
    final result = sharedPreferences.getBool(SharedPreferenceKeys.isLoginKey);
    if (result == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<void> logout() async {
    final removingLogin =
        await sharedPreferences.remove(SharedPreferenceKeys.isLoginKey);
    final removingUserData =
        await sharedPreferences.remove(SharedPreferenceKeys.userDataKey);

    if (removingUserData || removingLogin) {
      return;
    } else {
      throw Exception(CachFailure(message: "there are error while logout"));
    }
  }

  @override
  Future<void> saveLogin() async {
    final result =
        await sharedPreferences.setBool(SharedPreferenceKeys.isLoginKey, true);
    if (!result) {
      throw Exception(CachFailure(message: 'there are error While login'));
    }
  }
}
