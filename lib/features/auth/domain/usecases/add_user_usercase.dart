import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/auth/domain/entities/user.dart';
import 'package:shop/features/auth/domain/repositories/auth_repository.dart';

class AddUserUsercase {
  final AuthRepository authRepository;
  AddUserUsercase({required this.authRepository});
  Future<Either<Failure, void>> call(User user) async {
    return await authRepository.addUser(user);
  }
}
