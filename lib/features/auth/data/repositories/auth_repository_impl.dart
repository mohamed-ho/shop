import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:shop/features/auth/data/models/user_model.dart';
import 'package:shop/features/auth/domain/entities/user.dart';
import 'package:shop/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, void>> addUser(User user) async {
    try {
      final result =
          await authRemoteDataSource.addUser(UserModel.fromUser(user));
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(int id) async {
    try {
      final result = await authRemoteDataSource.delteUser(id);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, User>> getUserData(int id) async {
    try {
      final result = await authRemoteDataSource.getUserData(id);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      final result = await authRemoteDataSource.login(email, password);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(User user) async {
    try {
      final result =
          await authRemoteDataSource.updateUser(UserModel.fromUser(user));
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
