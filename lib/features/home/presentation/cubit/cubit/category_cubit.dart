import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/home/domain/entities/category.dart';
import 'package:shop/features/home/domain/usecases/add_category_usecase.dart';
import 'package:shop/features/home/domain/usecases/delete_category_usecase.dart';
import 'package:shop/features/home/domain/usecases/get_category_usecase.dart';
import 'package:shop/features/home/domain/usecases/updaet_category_usecase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final AddCategoryUsecase addCategoryUsecase;
  final DeleteCategoryUsecase deleteCategoryUsecase;
  final UpdaetCategoryUsecase updaetCategoryUsecase;
  final GetCategoryUsecase getCategoryUsecase;
  CategoryCubit(
      {required this.addCategoryUsecase,
      required this.deleteCategoryUsecase,
      required this.getCategoryUsecase,
      required this.updaetCategoryUsecase})
      : super(CategoryInitial());

  Future<void> addCategory({required ProductCategory category}) async {
    emit(CategoryLoadingState());
    final result = await addCategoryUsecase(category);
    result.fold((l) => emit(CategoryErrorState(message: l.message)),
        (r) => emit(CategoryLoadedState()));
  }

  Future<void> updateCategory({required ProductCategory category}) async {
    emit(CategoryLoadingState());
    final result = await updaetCategoryUsecase(category);
    result.fold((l) => emit(CategoryErrorState(message: l.message)),
        (r) => emit(CategoryLoadedState()));
  }

  Future<void> deleteCategory({required int categoryId}) async {
    emit(CategoryLoadingState());
    final result = await deleteCategoryUsecase(categoryId);
    result.fold((l) => emit(CategoryErrorState(message: l.message)),
        (r) => emit(CategoryLoadedState()));
  }

  Future<void> getAllCategories() async {
    emit(CategoryLoadingState());
    final result = await getCategoryUsecase();
    result.fold((l) => emit(CategoryErrorState(message: l.message)),
        (r) => emit(CategoryGetedState(categories: r)));
  }
}
