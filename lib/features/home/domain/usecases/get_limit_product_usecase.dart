import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/home/domain/repositories/product_repository.dart';

class GetLimitProductUsecase {
  final ProductRepository productRepository;

  GetLimitProductUsecase({required this.productRepository});
  Future<Either<Failure, List<ProductModal>>> call(int numberOfProduct) async {
    return await productRepository.getLimitProduct(numberOfProduct);
  }
}
