import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/data/datasources/category_remote_data_source.dart';
import 'package:shop/features/home/data/models/product_category_model.dart';
import 'package:shop/features/home/domain/entities/category.dart';
import 'package:shop/features/home/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepositoryImpl({required this.categoryRemoteDataSource});
  @override
  Future<Either<Failure, void>> addCategory(ProductCategory category) async {
    try {
      final result = await categoryRemoteDataSource
          .addCategory(ProductCategoryModel.fromProductCategory(category));
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory(int categoryId) async {
    try {
      final result = await categoryRemoteDataSource.deleteCategory(categoryId);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<ProductCategory>>> getCategories() async {
    try {
      final result = await categoryRemoteDataSource.getCategories();
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory(ProductCategory category) async {
    try {
      final result = await categoryRemoteDataSource
          .updateCategory(ProductCategoryModel.fromProductCategory(category));
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
