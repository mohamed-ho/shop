import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/admin/domain/entities/admin.dart';
import 'package:shop/features/admin/domain/usecases/add_admin_account_usecase.dart';
import 'package:shop/features/admin/domain/usecases/admin_login_usecase.dart';
import 'package:shop/features/admin/domain/usecases/delete_admin_account_usecase.dart';
import 'package:shop/features/admin/domain/usecases/get_all_admins_usecase.dart';
import 'package:shop/features/admin/domain/usecases/update_admin_account_usecase.dart';
part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  final AddAdminAccountUsecase addAdminAccountUsecase;
  final UpdateAdminAccountUsecase updateAdminAccountUsecase;
  final AdminLoginUsecase adminLoginUsecase;
  final DeleteAdminAccountUsecase deleteAdminAccountUsecase;
  final GetAllAdminsUsecase getAllAdminsUsecase;

  AdminCubit(
      {required this.addAdminAccountUsecase,
      required this.adminLoginUsecase,
      required this.deleteAdminAccountUsecase,
      required this.updateAdminAccountUsecase,
      required this.getAllAdminsUsecase})
      : super(AdminInitial());

  Future<void> addAdminAccount(Admin admin) async {
    emit(AdminLoadingState());
    final result = await addAdminAccountUsecase(admin);
    result.fold((l) => emit(AdminErrorState(message: l.message)),
        (r) => emit(AdminLoadedState()));
  }

  Future<void> updateAdminAccount(Admin admin) async {
    emit(AdminLoadingState());
    final result = await updateAdminAccountUsecase(admin);
    result.fold((l) => emit(AdminErrorState(message: l.message)),
        (r) => emit(AdminLoadedState()));
  }

  Future<void> loginAdmin(
      {required String username, required String password}) async {
    emit(AdminLoadingState());
    final result = await adminLoginUsecase(username, password);
    result.fold((l) => emit(AdminErrorState(message: l.message)),
        (r) => emit(AdminLoadedState()));
  }

  Future<void> deleteAdminAccount(int adminId) async {
    emit(AdminLoadingState());
    final result = await deleteAdminAccountUsecase(adminId);
    result.fold((l) => emit(AdminErrorState(message: l.message)),
        (r) => emit(AdminLoadedState()));
  }

  Future<void> getAllAdmins() async {
    emit(AdminLoadedState());
    final result = await getAllAdminsUsecase();
    result.fold((l) => emit(AdminErrorState(message: l.message)),
        (r) => emit(AdminGetedState(admins: r)));
  }
}
