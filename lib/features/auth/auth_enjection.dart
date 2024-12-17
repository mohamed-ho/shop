import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:shop/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:shop/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:shop/features/auth/domain/repositories/auth_repository.dart';
import 'package:shop/features/auth/domain/usecases/add_user_usercase.dart';
import 'package:shop/features/auth/domain/usecases/delete_user_usecase.dart';
import 'package:shop/features/auth/domain/usecases/get_user_data_usecase.dart';
import 'package:shop/features/auth/domain/usecases/login_usecase.dart';
import 'package:shop/features/auth/domain/usecases/logout_usecase.dart';
import 'package:shop/features/auth/domain/usecases/update_user_usercase.dart';
import 'package:shop/features/auth/presentation/cubit/auth_cubit.dart';

class AuthEnjection {
  init() {
    ls.registerFactory(() => AuthCubit(
        addUserUsercase: ls(),
        deleteUserUsecase: ls(),
        getUserDataUsecase: ls(),
        loginUsecase: ls(),
        updateUserUsercase: ls(),
        logoutUsecase: ls()));
    ls.registerLazySingleton(() => AddUserUsercase(authRepository: ls()));
    ls.registerLazySingleton(() => DeleteUserUsecase(authRepository: ls()));
    ls.registerLazySingleton(() => GetUserDataUsecase(authRepository: ls()));
    ls.registerLazySingleton(() => LoginUsecase(authRepository: ls()));
    ls.registerLazySingleton(() => UpdateUserUsercase(authRepository: ls()));
    ls.registerLazySingleton(() => LogoutUsecase(authRepository: ls()));

    ls.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(authRemoteDataSource: ls()));

    ls.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(httpService: ls()));
    ls.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(sharedPreferences: ls()));
  }
}
