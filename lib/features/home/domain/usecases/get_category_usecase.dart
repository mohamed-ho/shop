import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/domain/repositories/product_repository.dart';

class GetCategoryUsecase {
  final ProductRepository productRepository;

  GetCategoryUsecase({required this.productRepository});
  Future<Either<Failure, List<String>>> call() async {
    return await productRepository.getCategory();
  }
}
