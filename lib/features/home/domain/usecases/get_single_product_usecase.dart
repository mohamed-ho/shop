import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/home/domain/repositories/product_repository.dart';

class GetSingleProductUsecase {
  final ProductRepository productRepository;

  GetSingleProductUsecase({required this.productRepository});
  Future<Either<Failure, ProductModal>> call(int id) async {
    return await productRepository.getSingleProduct(id);
  }
}
