import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> addUser(User user);
  Future<Either<Failure, void>> updateUser(User user);
  Future<Either<Failure, void>> deleteUser(int id);
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> logout();
}
