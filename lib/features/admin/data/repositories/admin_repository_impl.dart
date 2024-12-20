import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/admin/data/datasources/admin_remote_data_source.dart';
import 'package:shop/features/admin/data/models/admin_model.dart';
import 'package:shop/features/admin/domain/entities/admin.dart';
import 'package:shop/features/admin/domain/repositories/admin_repository.dart';

class AdminRepositoryImpl implements AdminRepository {
  final AdminRemoteDataSource adminRemoteDataSource;

  AdminRepositoryImpl({required this.adminRemoteDataSource});
  @override
  Future<Either<Failure, void>> addAccount(Admin admin) async {
    try {
      final result = await adminRemoteDataSource
          .addAdminAccount(AdminModel.fromAdmin(admin));
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount(int adminId) async {
    try {
      final result = await adminRemoteDataSource.deleteAddminAccount(adminId);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Admin>> login(String username, String password) async {
    try {
      final result = await adminRemoteDataSource.login(username, password);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> updateAccount(Admin admin) async {
    try {
      final result = await adminRemoteDataSource
          .updateAdminAccount(AdminModel.fromAdmin(admin));
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<Admin>>> getAllAdmins() async {
    try {
      final result = await adminRemoteDataSource.getAllAdmins();
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
