import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/home/domain/repositories/product_repository.dart';

class AddNewProductUsecase {
  final ProductRepository productRepository;

  AddNewProductUsecase({required this.productRepository});
  Future<Either<Failure, ProductModal>> call(ProductModal product) async {
    return await productRepository.addNewProduct(product);
  }
}
