import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/domain/entities/category.dart';
import 'package:shop/features/home/domain/repositories/category_repository.dart';

class GetCategoryUsecase {
  final CategoryRepository categoryRepository;

  GetCategoryUsecase({required this.categoryRepository});
  Future<Either<Failure, List<ProductCategory>>> call() async {
    return await categoryRepository.getCategories();
  }
}
