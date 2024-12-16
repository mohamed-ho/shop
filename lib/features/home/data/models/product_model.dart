import 'package:shop/core/constant/productName.dart';
import 'package:shop/features/home/data/models/rate_model.dart';

class ProductModal {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RateModel? rate;
  ProductModal(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      this.rate});

  factory ProductModal.fromJson(jsonData) {
    return ProductModal(
        id: jsonData[kProductId],
        title: jsonData[kProductTitle],
        price: jsonData[kProductPrice].toDouble(),
        description: jsonData[kProductDescription],
        category: jsonData[kProductCategory],
        image: jsonData[kProductImage],
        rate: jsonData['rating'] == null
            ? null
            : RateModel.fromJson(jsonData['rating']));
  }

  toJson() {
    return {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
      "rating": rate?.tojson(),
    };
  }
}
