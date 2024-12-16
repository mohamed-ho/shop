import 'package:shop/features/auth/domain/entities/name.dart';

class NameModel extends Name {
  NameModel({required super.firstName, required super.lastName});

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(firstName: json['firstname'], lastName: json['lastname']);
  }

  factory NameModel.fromName(Name name) {
    return NameModel(firstName: name.firstName, lastName: name.lastName);
  }

  toJson() {
    return {'firstname': firstName, 'lastname': lastName};
  }
}
