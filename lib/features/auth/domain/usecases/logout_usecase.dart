import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository authRepository;
  LogoutUsecase({required this.authRepository});
  Future<Either<Failure, void>> call() async {
    return await authRepository.logout();
  }
}
