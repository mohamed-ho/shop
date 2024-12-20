import 'package:shop/features/admin/domain/entities/admin.dart';

class AdminModel extends Admin {
  AdminModel({required super.id, super.passwrod, required super.username});
  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
        id: json['id'], passwrod: json["password"], username: json['username']);
  }
  factory AdminModel.fromAdmin(Admin admin) {
    return AdminModel(
        id: admin.id, passwrod: admin.passwrod, username: admin.username);
  }

  toJson() {
    return {'id': id, 'password': passwrod, 'username': username};
  }
}
