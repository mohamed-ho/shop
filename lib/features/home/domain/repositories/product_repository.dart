import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/data/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModal>>> getAllProduct();
  Future<Either<Failure, ProductModal>> getSingleProduct(int id);

  Future<Either<Failure, List<ProductModal>>> getProductInCategory(
      int categoryId);
  Future<Either<Failure, void>> addNewProduct(ProductModal product);
  Future<Either<Failure, void>> updateProduct(ProductModal product);
  Future<Either<Failure, void>> deleteProduct(int productId);
}
