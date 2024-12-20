import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/admin/domain/repositories/admin_repository.dart';

class DeleteAdminAccountUsecase {
  final AdminRepository adminRepository;
  DeleteAdminAccountUsecase({required this.adminRepository});
  Future<Either<Failure, void>> call(int adminId) async {
    return await adminRepository.deleteAccount(adminId);
  }
}
