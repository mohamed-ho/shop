import 'package:shop/core/constant/end_points.dart';
import 'package:shop/core/server_service/server_service.dart';
import 'package:shop/features/home/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModal>> getAllProducts();
  Future<ProductModal> getSingleProduct(int id);
  Future<List<ProductModal>> getLimitProducts(int numberOfProduct);
  Future<List<ProductModal>> getProductInCategory(String category);
  Future<ProductModal> addProduct(ProductModal product);
  Future<ProductModal> updateProduct(ProductModal product);
  Future<void> deleteProduct(int id);
  Future<List<String>> getCategories();
}

class ProductRemoteDataSourceImple implements ProductRemoteDataSource {
  final ServerService serverService;
  ProductRemoteDataSourceImple({required this.serverService});
  @override
  Future<ProductModal> addProduct(ProductModal product) async {
    final result = await serverService.post(
        url: EndPoints.addNewProductUrl, data: product.toJson()) as Map;
    return product;
  }

  @override
  Future<void> deleteProduct(int id) async {
    await serverService.patch(url: EndPoints.deleteProductUrl(id: id));
  }

  @override
  Future<List<ProductModal>> getAllProducts() async {
    final result =
        await serverService.get(url: EndPoints.addNewProductUrl) as List;
    return List<ProductModal>.from(result.map((e) => ProductModal.fromJson(e)));
  }

  @override
  Future<List<String>> getCategories() async {
    final result =
        await serverService.get(url: EndPoints.getCategoriesUrl) as List;
    return List<String>.from(result.map((e) => e));
  }

  @override
  Future<List<ProductModal>> getLimitProducts(int numberOfProduct) async {
    final result = await serverService.get(
            url: EndPoints.getLimitProductUrl(numberOrProduct: numberOfProduct))
        as List;
    return List<ProductModal>.from(result.map((e) => ProductModal.fromJson(e)));
  }

  @override
  Future<List<ProductModal>> getProductInCategory(String category) async {
    final result = await serverService.get(
        url: EndPoints.getProductInCategoryUrl(category: category)) as List;
    return List<ProductModal>.from(result.map((e) => ProductModal.fromJson(e)));
  }

  @override
  Future<ProductModal> getSingleProduct(int id) async {
    final result =
        await serverService.get(url: EndPoints.getSingleProductUrl(id: id));
    return ProductModal.fromJson(result);
  }

  @override
  Future<ProductModal> updateProduct(ProductModal product) async {
    final result = await serverService.put(
        url: EndPoints.updateProductUrl(id: product.id),
        data: product.toJson()) as Map;
    return await getSingleProduct(result['id']);
  }
}
