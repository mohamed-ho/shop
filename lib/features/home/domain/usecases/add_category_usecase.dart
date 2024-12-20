import 'package:dartz/dartz.dart';

import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/domain/entities/category.dart';
import 'package:shop/features/home/domain/repositories/category_repository.dart';

class AddCategoryUsecase {
  final CategoryRepository categoryRepository;

  AddCategoryUsecase({required this.categoryRepository});
  Future<Either<Failure, void>> call(ProductCategory category) async {
    return await categoryRepository.addCategory(category);
  }
}