import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/admin/domain/entities/admin.dart';
import 'package:shop/features/admin/domain/repositories/admin_repository.dart';

class UpdateAdminAccountUsecase {
  final AdminRepository adminRepository;
  UpdateAdminAccountUsecase({required this.adminRepository});
  Future<Either<Failure, void>> call(Admin admin) async {
    return await adminRepository.updateAccount(admin);
  }
}
