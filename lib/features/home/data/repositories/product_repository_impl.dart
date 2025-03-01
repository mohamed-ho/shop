import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/data/datasources/product_remote_data_source.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/home/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});
  @override
  Future<Either<Failure, void>> addNewProduct(ProductModal product) async {
    try {
      final result = await productRemoteDataSource.addProduct(product);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(int productId) async {
    try {
      final result = await productRemoteDataSource.deleteProduct(productId);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<ProductModal>>> getAllProduct() async {
    try {
      final result = await productRemoteDataSource.getAllProducts();
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<ProductModal>>> getProductInCategory(
      int categoryId) async {
    try {
      final result =
          await productRemoteDataSource.getProductInCategory(categoryId);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, ProductModal>> getSingleProduct(int id) async {
    try {
      final result = await productRemoteDataSource.getSingleProduct(id);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(ProductModal product) async {
    try {
      final result = await productRemoteDataSource.updateProduct(product);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
