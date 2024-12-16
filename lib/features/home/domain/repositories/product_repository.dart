import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/data/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModal>>> getAllProduct();
  Future<Either<Failure, ProductModal>> getSingleProduct(int id);
  Future<Either<Failure, List<ProductModal>>> getLimitProduct(
      int numberOfProduct);
  Future<Either<Failure, List<ProductModal>>> getProductInCategory(
      String category);
  Future<Either<Failure, ProductModal>> addNewProduct(ProductModal product);
  Future<Either<Failure, ProductModal>> updateProduct(ProductModal product);
  Future<Either<Failure, void>> deleteProduct(int productId);
  Future<Either<Failure, List<String>>> getCategory();
}
