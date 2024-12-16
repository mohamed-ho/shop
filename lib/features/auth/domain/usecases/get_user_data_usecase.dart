import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/auth/domain/entities/user.dart';
import 'package:shop/features/auth/domain/repositories/auth_repository.dart';

class GetUserDataUsecase {
  final AuthRepository authRepository;
  GetUserDataUsecase({required this.authRepository});
  Future<Either<Failure, User>> call(int id) async {
    return await authRepository.getUserData(id);
  }
}
