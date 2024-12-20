import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/admin/domain/entities/admin.dart';
import 'package:shop/features/admin/domain/repositories/admin_repository.dart';

class AddAdminAccountUsecase {
  final AdminRepository adminRepository;
  AddAdminAccountUsecase({required this.adminRepository});
  Future<Either<Failure, void>> call(Admin admin) async {
    return await adminRepository.addAccount(admin);
  }
}