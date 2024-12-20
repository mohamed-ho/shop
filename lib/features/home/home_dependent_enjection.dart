import 'package:shop/core/server_service/http_service.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/home/data/datasources/category_remote_data_source.dart';
import 'package:shop/features/home/data/datasources/product_remote_data_source.dart';
import 'package:shop/features/home/data/repositories/category_repository_impl.dart';
import 'package:shop/features/home/data/repositories/product_repository_impl.dart';
import 'package:shop/features/home/domain/repositories/category_repository.dart';
import 'package:shop/features/home/domain/repositories/product_repository.dart';
import 'package:shop/features/home/domain/usecases/add_category_usecase.dart';
import 'package:shop/features/home/domain/usecases/add_new_product_usecase.dart';
import 'package:shop/features/home/domain/usecases/delete_category_usecase.dart';
import 'package:shop/features/home/domain/usecases/delete_product_usecase.dart';
import 'package:shop/features/home/domain/usecases/get_all_product_usecase.dart';
import 'package:shop/features/home/domain/usecases/get_category_usecase.dart';

import 'package:shop/features/home/domain/usecases/get_product_in_category_usecase.dart';
import 'package:shop/features/home/domain/usecases/get_single_product_usecase.dart';
import 'package:shop/features/home/domain/usecases/updaet_category_usecase.dart';
import 'package:shop/features/home/domain/usecases/update_product_usecase.dart';
import 'package:shop/features/home/presentation/cubit/cubit/category_cubit.dart';
import 'package:shop/features/home/presentation/cubit/cubit/product_cubit.dart';

class HomeDependentEnjection {
  init() {
    ls.registerFactory(() => ProductCubit(
        addNewProductUsecase: ls(),
        deleteProductUsecase: ls(),
        getAllProductUsecase: ls(),
        getProductInCategoryUsecase: ls(),
        getSingleProductUsecase: ls(),
        updateProductUsecase: ls()));

    ls.registerFactory(() => CategoryCubit(
        addCategoryUsecase: ls(),
        deleteCategoryUsecase: ls(),
        getCategoryUsecase: ls(),
        updaetCategoryUsecase: ls()));

    ls.registerLazySingleton(
        () => AddNewProductUsecase(productRepository: ls()));
    ls.registerLazySingleton(
        () => DeleteProductUsecase(productRepository: ls()));
    ls.registerLazySingleton(
        () => GetAllProductUsecase(productRepository: ls()));
    ls.registerLazySingleton(
        () => GetProductInCategoryUsecase(productRepository: ls()));
    ls.registerLazySingleton(
        () => GetSingleProductUsecase(productRepository: ls()));
    ls.registerLazySingleton(
        () => UpdateProductUsecase(productRepository: ls()));

    ls.registerLazySingleton(
        () => AddCategoryUsecase(categoryRepository: ls()));
    ls.registerLazySingleton(
        () => DeleteCategoryUsecase(categoryRepository: ls()));
    ls.registerLazySingleton(
        () => GetCategoryUsecase(categoryRepository: ls()));
    ls.registerLazySingleton(
        () => UpdaetCategoryUsecase(categoryRepository: ls()));

    ls.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(productRemoteDataSource: ls()));

    ls.registerLazySingleton<CategoryRepository>(
        () => CategoryRepositoryImpl(categoryRemoteDataSource: ls()));

    ls.registerLazySingleton<ProductRemoteDataSource>(
        () => ProductRemoteDataSourceImple(serverService: ls()));

    ls.registerLazySingleton<CategoryRemoteDataSource>(
        () => CategoryRemoteDataSourceImpl(httpService: ls()));
    ls.registerLazySingleton(() => HttpService());
  }
}
