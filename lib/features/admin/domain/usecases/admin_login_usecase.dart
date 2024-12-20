import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/admin/domain/entities/admin.dart';
import 'package:shop/features/admin/domain/repositories/admin_repository.dart';

class AdminLoginUsecase {
  final AdminRepository adminRepository;
  AdminLoginUsecase({required this.adminRepository});
  Future<Either<Failure, Admin>> call(String username, String password) async {
    return await adminRepository.login(username, password);
  }
}
