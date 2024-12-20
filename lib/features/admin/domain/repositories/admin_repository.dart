import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/admin/domain/entities/admin.dart';

abstract class AdminRepository {
  Future<Either<Failure, Admin>> login(String username, String password);
  Future<Either<Failure, void>> addAccount(Admin admin);
  Future<Either<Failure, void>> updateAccount(Admin admin);
  Future<Either<Failure, void>> deleteAccount(int adminId);
  Future<Either<Failure, List<Admin>>> getAllAdmins();
}
