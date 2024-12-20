import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/admin/data/datasources/admin_remote_data_source.dart';
import 'package:shop/features/admin/data/repositories/admin_repository_impl.dart';
import 'package:shop/features/admin/domain/repositories/admin_repository.dart';
import 'package:shop/features/admin/domain/usecases/add_admin_account_usecase.dart';
import 'package:shop/features/admin/domain/usecases/admin_login_usecase.dart';
import 'package:shop/features/admin/domain/usecases/delete_admin_account_usecase.dart';
import 'package:shop/features/admin/domain/usecases/get_all_admins_usecase.dart';
import 'package:shop/features/admin/domain/usecases/update_admin_account_usecase.dart';
import 'package:shop/features/admin/presentation/cubit/admin_cubit.dart';

class AdminEnjection {
  init() {
    ls.registerFactory(() => AdminCubit(
        addAdminAccountUsecase: ls(),
        adminLoginUsecase: ls(),
        deleteAdminAccountUsecase: ls(),
        updateAdminAccountUsecase: ls(),
        getAllAdminsUsecase: ls()));
    ls.registerLazySingleton(
        () => AddAdminAccountUsecase(adminRepository: ls()));
    ls.registerLazySingleton(() => AdminLoginUsecase(adminRepository: ls()));
    ls.registerLazySingleton(
        () => DeleteAdminAccountUsecase(adminRepository: ls()));
    ls.registerLazySingleton(
        () => UpdateAdminAccountUsecase(adminRepository: ls()));
    ls.registerLazySingleton(() => GetAllAdminsUsecase(adminRepository: ls()));

    ls.registerLazySingleton<AdminRepository>(
        () => AdminRepositoryImpl(adminRemoteDataSource: ls()));
    ls.registerLazySingleton<AdminRemoteDataSource>(
        () => AdminRemoteDataSourceImpl(httpService: ls()));
  }
}
