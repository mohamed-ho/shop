import 'package:shop/features/auth/domain/entities/address.dart';

class AddressModel extends Address {
  AddressModel(
      {required super.street, required super.city, required super.number});
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        street: json['street'], city: json['city'], number: json['number']);
  }

  factory AddressModel.fromAddress(Address address) {
    return AddressModel(
        street: address.street, city: address.city, number: address.number);
  }

  toJson() {
    return {
      'city': city,
      'street': street,
      'number': number,
      'zipcode': '12926-3874',
      'geolocation': {'lat': '-37.3159', 'long': '81.1496'}
    };
  }
}
