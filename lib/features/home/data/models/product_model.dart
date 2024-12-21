import 'package:shop/core/constant/productName.dart';
import 'package:shop/features/home/data/models/rate_model.dart';

class ProductModal {
  int id;
  String title;
  double price;
  String description;
  int category;
  String image;
  RateModel? rate;
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
        id: jsonData['id'],
        title: jsonData['title'],
        price: double.parse(jsonData['price']),
        description: jsonData['description'],
        category: jsonData['category_id'],
        image: jsonData[kProductImage],
        rate: jsonData['rating'] == null
            ? null
            : RateModel.fromJson(jsonData['rating']));
  }

  factory ProductModal.clone(ProductModal product) {
    return ProductModal(
        id: product.id,
        title: product.title,
        price: product.price,
        description: product.description,
        category: product.category,
        image: product.image);
  }
  toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
      "rating": rate!.tojson(),
    };
  }
}
