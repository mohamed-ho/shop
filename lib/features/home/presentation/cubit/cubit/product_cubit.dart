import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/home/domain/usecases/add_new_product_usecase.dart';
import 'package:shop/features/home/domain/usecases/delete_product_usecase.dart';
import 'package:shop/features/home/domain/usecases/get_all_product_usecase.dart';
import 'package:shop/features/home/domain/usecases/get_product_in_category_usecase.dart';
import 'package:shop/features/home/domain/usecases/get_single_product_usecase.dart';
import 'package:shop/features/home/domain/usecases/update_product_usecase.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetAllProductUsecase getAllProductUsecase;
  final GetSingleProductUsecase getSingleProductUsecase;

  final GetProductInCategoryUsecase getProductInCategoryUsecase;
  final AddNewProductUsecase addNewProductUsecase;
  final UpdateProductUsecase updateProductUsecase;
  final DeleteProductUsecase deleteProductUsecase;

  ProductCubit(
      {required this.addNewProductUsecase,
      required this.deleteProductUsecase,
      required this.getAllProductUsecase,
      required this.getProductInCategoryUsecase,
      required this.getSingleProductUsecase,
      required this.updateProductUsecase})
      : super(ProductInitial());

  Future<void> getAllProducts() async {
    emit(ProductLoadingState());
    final result = await getAllProductUsecase();
    result.fold((l) => emit(ProductErrorState(message: l.message)),
        (r) => emit(ProductGetProductsState(products: r)));
  }

  Future<void> getSingleProduct({required int productId}) async {
    emit(ProductLoadingState());
    final result = await getSingleProductUsecase(productId);
    result.fold((l) => emit(ProductErrorState(message: l.message)),
        (r) => emit(ProductgetSingleProductState(product: r)));
  }

  Future<void> getProductInCategory({required int categoryId}) async {
    emit(ProductLoadingState());
    final result = await getProductInCategoryUsecase(categoryId);
    result.fold((l) => emit(ProductErrorState(message: l.message)),
        (r) => emit(ProductGetProductsState(products: r)));
  }

  Future<void> addNewProduct({required ProductModal product}) async {
    emit(ProductLoadingState());
    final result = await addNewProductUsecase(product);
    result.fold((l) => emit(ProductErrorState(message: l.message)),
        (r) => emit(ProductLoadedstate()));
  }

  Future<void> updateProduct({required ProductModal product}) async {
    emit(ProductLoadingState());
    final result = await updateProductUsecase(product);
    result.fold((l) => emit(ProductErrorState(message: l.message)),
        (r) => emit(ProductLoadedstate()));
  }

  Future<void> deleteProduct({required int productId}) async {
    emit(ProductLoadingState());
    final result = await deleteProductUsecase(productId);
    result.fold((l) => emit(ProductErrorState(message: l.message)),
        (r) => emit(ProductLoadedstate()));
  }
}
