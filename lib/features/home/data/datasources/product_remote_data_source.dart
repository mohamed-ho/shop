import 'package:shop/core/constant/end_points.dart';
import 'package:shop/core/server_service/server_service.dart';
import 'package:shop/features/home/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModal>> getAllProducts();
  Future<ProductModal> getSingleProduct(int id);
  Future<List<ProductModal>> getProductInCategory(int id);
  Future<void> addProduct(ProductModal product);
  Future<void> updateProduct(ProductModal product);
  Future<void> deleteProduct(int id);
}

class ProductRemoteDataSourceImple implements ProductRemoteDataSource {
  final ServerService serverService;
  ProductRemoteDataSourceImple({required this.serverService});
  @override
  Future<void> addProduct(ProductModal product) async {
    await serverService.post(
        url: EndPoints.addNewProductUrl, data: product.toJson()) as Map;
  }

  @override
  Future<void> deleteProduct(int id) async {
    await serverService.post(url: EndPoints.deleteProductUrl, data: {"id": id});
  }

  @override
  Future<List<ProductModal>> getAllProducts() async {
    final result = await serverService.get(url: EndPoints.getAllProductUrl);
    return List<ProductModal>.from(result.map((e) => ProductModal.fromJson(e)));
  }

  @override
  Future<List<ProductModal>> getProductInCategory(int id) async {
    final result = await serverService.post(
        url: EndPoints.getProductInCategoryUrl,
        data: {"category_id": id}) as List;
    return List<ProductModal>.from(result.map((e) => ProductModal.fromJson(e)));
  }

  @override
  Future<ProductModal> getSingleProduct(int id) async {
    final result = await serverService
        .post(url: EndPoints.getSingleProductUrl, data: {"id": id});
    return ProductModal.fromJson(result);
  }

  @override
  Future<void> updateProduct(ProductModal product) async {
    await serverService.put(
        url: EndPoints.updateProductUrl, data: product.toJson()) as Map;
  }
}
