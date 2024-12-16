import 'package:shop/features/auth/domain/entities/address.dart';
import 'package:shop/features/auth/domain/entities/name.dart';

class User {
  int id;
  String email;
  String password;
  String username;
  String phone;
  Name name;
  Address address;

  User(
      {required this.address,
      required this.email,
      required this.id,
      required this.name,
      required this.password,
      required this.phone,
      required this.username});
}
