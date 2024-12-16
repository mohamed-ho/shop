import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/auth/domain/repositories/auth_repository.dart';

class DeleteUserUsecase {
  final AuthRepository authRepository;
  DeleteUserUsecase({required this.authRepository});
  Future<Either<Failure, void>> call(int id) async {
    return await authRepository.deleteUser(id);
  }
}
