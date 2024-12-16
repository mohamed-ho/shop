import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/domain/repositories/product_repository.dart';

class DeleteProductUsecase {
  final ProductRepository productRepository;

  DeleteProductUsecase({required this.productRepository});
  Future<Either<Failure, void>> call(int id) async {
    return await productRepository.deleteProduct(id);
  }
}
