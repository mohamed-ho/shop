part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoadingState extends CategoryState {}

final class CategoryLoadedState extends CategoryState {}

final class CategoryGetedState extends CategoryState {
  final List<ProductCategory> categories;

  const CategoryGetedState({required this.categories});
}

final class CategoryErrorState extends CategoryState {
  final String message;

  const CategoryErrorState({required this.message});
}
