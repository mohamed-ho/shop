import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/home/domain/repositories/product_repository.dart';

class UpdateProductUsecase {
  final ProductRepository productRepository;

  UpdateProductUsecase({required this.productRepository});
  Future<Either<Failure, void>> call(ProductModal product) async {
    return await productRepository.updateProduct(product);
  }
}
