import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/domain/repositories/category_repository.dart';

class DeleteCategoryUsecase {
  final CategoryRepository categoryRepository;

  DeleteCategoryUsecase({required this.categoryRepository});
  Future<Either<Failure, void>> call(int categoryId) async {
    return await categoryRepository.deleteCategory(categoryId);
  }
}
