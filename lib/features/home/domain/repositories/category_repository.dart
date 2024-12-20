import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<ProductCategory>>> getCategories();
  Future<Either<Failure, void>> addCategory(ProductCategory category);
  Future<Either<Failure, void>> updateCategory(ProductCategory category);
  Future<Either<Failure, void>> deleteCategory(int categoryId);
}
