import 'package:shop/features/auth/data/models/address_model.dart';
import 'package:shop/features/auth/data/models/name_model.dart';
import 'package:shop/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.address,
      required super.email,
      required super.id,
      required super.name,
      required super.password,
      required super.phone,
      required super.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        address: AddressModel.fromJson(json['address']),
        email: json['email'],
        id: json['id'],
        name: NameModel.fromJson(json['name']),
        password: json['password'],
        phone: json['phone'],
        username: json['username']);
  }

  toJson() {
    return {
      'address': AddressModel.fromAddress(address).toJson(),
      'email': email,
      'name': NameModel.fromName(name).toJson(),
      'password': password,
      'phone': phone,
      'username': username,
      'id': 1,
    };
  }

  factory UserModel.fromUser(User user) {
    return UserModel(
        address: user.address,
        email: user.email,
        id: user.id,
        name: user.name,
        password: user.password,
        phone: user.phone,
        username: user.username);
  }
}
