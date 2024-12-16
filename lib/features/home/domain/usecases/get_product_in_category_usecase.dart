import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/home/domain/repositories/product_repository.dart';

class GetProductInCategoryUsecase {
  final ProductRepository productRepository;

  GetProductInCategoryUsecase({required this.productRepository});
  Future<Either<Failure, List<ProductModal>>> call(String category) async {
    return await productRepository.getProductInCategory(category);
  }
}
