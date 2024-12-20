import 'package:shop/features/home/domain/entities/category.dart';

class ProductCategoryModel extends ProductCategory {
  ProductCategoryModel(
      {required super.id, required super.image, required super.name});
  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
        id: json['id'], image: json['image'], name: json['name']);
  }

  factory ProductCategoryModel.fromProductCategory(ProductCategory category) {
    return ProductCategoryModel(
        id: category.id, image: category.image, name: category.name);
  }

  toJson() {
    return {"id": id, "image": image, "name": name};
  }
}
