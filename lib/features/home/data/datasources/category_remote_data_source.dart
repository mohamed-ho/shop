import 'package:shop/core/constant/end_points.dart';
import 'package:shop/core/server_service/http_service.dart';
import 'package:shop/features/home/data/models/product_category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<void> addCategory(ProductCategoryModel category);
  Future<void> updateCategory(ProductCategoryModel category);
  Future<void> deleteCategory(int categoryId);
  Future<List<ProductCategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final HttpService httpService;

  CategoryRemoteDataSourceImpl({required this.httpService});
  @override
  Future<void> addCategory(ProductCategoryModel category) async {
    await httpService.post(
        url: EndPoints.addCategoryUrl, data: category.toJson());
  }

  @override
  Future<void> deleteCategory(int categoryId) async {
    await httpService
        .post(url: EndPoints.deleteCategoryUrl, data: {"id": categoryId});
  }

  @override
  Future<List<ProductCategoryModel>> getCategories() async {
    final result = await httpService.get(url: EndPoints.getCategoriesUrl);
    return List<ProductCategoryModel>.from(
        result.map((e) => ProductCategoryModel.fromJson(e)));
  }

  @override
  Future<void> updateCategory(ProductCategoryModel category) async {
    await httpService.post(
        url: EndPoints.updateCategoryUrl, data: category.toJson());
  }
}
