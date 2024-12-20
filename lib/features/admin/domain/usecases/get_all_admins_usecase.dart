import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/admin/domain/entities/admin.dart';
import 'package:shop/features/admin/domain/repositories/admin_repository.dart';

class GetAllAdminsUsecase {
  final AdminRepository adminRepository;
  GetAllAdminsUsecase({required this.adminRepository});
  Future<Either<Failure, List<Admin>>> call() async {
    return await adminRepository.getAllAdmins();
  }
}
