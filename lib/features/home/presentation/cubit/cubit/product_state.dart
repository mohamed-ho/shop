part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductErrorState extends ProductState {
  final String message;

  const ProductErrorState({required this.message});
}

final class ProductGetProductsState extends ProductState {
  final List<ProductModal> products;

  const ProductGetProductsState({required this.products});
}

final class ProductgetSingleProductState extends ProductState {
  final ProductModal product;

  const ProductgetSingleProductState({required this.product});
}

final class ProductLoadedstate extends ProductState {}

final class ProductGetCategories extends ProductState {
  final List<String> categories;

  const ProductGetCategories({required this.categories});
}
