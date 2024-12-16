import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/core/constant/shared_preference_keys.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/cart/data/models/cart_model.dart';
import 'package:shop/features/cart/data/models/cart_product_model.dart';

abstract class CartLocalDataSource {
  CartModel? getLocalCart();
  Future<void> addToLocalCart(CartProductModel cart);
  Future<void> update(CartProductModel cart, int index);
  Future<void> deleteItemFromLocalCart(int index);
  Future<void> deleteLocalCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final SharedPreferences sharedPreferences;

  CartLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> addToLocalCart(CartProductModel cartProdutModel) async {
    try {
      final localCart =
          sharedPreferences.getString(SharedPreferenceKeys.localCartKey);
      late bool result;
      if (localCart != null) {
        CartModel cartModel = CartModel.fromJson(jsonDecode(localCart));
        cartModel.cartProducts.add(cartProdutModel);
        result = await sharedPreferences.setString(
            SharedPreferenceKeys.localCartKey, jsonEncode(cartModel.toJson()));
      } else {
        result = await sharedPreferences.setString(
            SharedPreferenceKeys.localCartKey,
            jsonEncode(CartModel(
                id: 1,
                userId: 1,
                date: DateTime.now(),
                cartProducts: [cartProdutModel]).toJson()));
      }
      result
          ? 0
          : throw Exception(CachFailure(message: 'adding process is failed'));
    } catch (e) {
      throw Exception(CachFailure(message: e.toString()));
    }
  }

  @override
  Future<void> deleteItemFromLocalCart(int index) async {
    try {
      final localCart =
          sharedPreferences.getString(SharedPreferenceKeys.localCartKey);
      late bool result;
      if (localCart != null) {
        CartModel cartModel = CartModel.fromJson(jsonDecode(localCart));
        if (cartModel.cartProducts.length < 2) {
          result =
              await sharedPreferences.remove(SharedPreferenceKeys.localCartKey);
        } else {
          cartModel.cartProducts.removeAt(index);
          result = await sharedPreferences.setString(
              SharedPreferenceKeys.localCartKey,
              jsonEncode(cartModel.toJson()));
        }
      } else {
        return;
      }
      result
          ? 0
          : throw Exception(CachFailure(message: 'Deleting process is failed'));
    } catch (e) {
      throw Exception(CachFailure(message: e.toString()));
    }
  }

  @override
  Future<void> deleteLocalCart() async {
    try {
      List<String>? cartItem =
          sharedPreferences.getStringList(SharedPreferenceKeys.localCartKey);
      late bool result;
      if (cartItem != null) {
        result =
            await sharedPreferences.remove(SharedPreferenceKeys.localCartKey);
      } else {
        return;
      }
      result
          ? 0
          : throw Exception(CachFailure(message: 'Deleting process is failed'));
    } catch (e) {
      throw Exception(CachFailure(message: e.toString()));
    }
  }

  @override
  CartModel? getLocalCart() {
    try {
      final localCart =
          sharedPreferences.getString(SharedPreferenceKeys.localCartKey);
      if (localCart != null) {
        return CartModel.fromJson(jsonDecode(localCart));
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(CachFailure(message: e.toString()));
    }
  }

  @override
  Future<void> update(CartProductModel cartProduct, int index) async {
    try {
      final localCart =
          sharedPreferences.getString(SharedPreferenceKeys.localCartKey);
      late bool result;
      if (localCart != null) {
        CartModel cartModel = CartModel.fromJson(jsonDecode(localCart));

        cartModel.cartProducts[index] = cartProduct;

        result = await sharedPreferences.setString(
            SharedPreferenceKeys.localCartKey, jsonEncode(cartModel.toJson()));
      } else {
        throw Exception(CachFailure(message: 'No product in Cart'));
      }
      result
          ? 0
          : throw Exception(
              CachFailure(message: 'Updating  process is failed'));
    } catch (e) {
      throw Exception(CachFailure(message: e.toString()));
    }
  }
}
