import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/auth/domain/entities/user.dart';
import 'package:shop/features/auth/domain/usecases/add_user_usercase.dart';
import 'package:shop/features/auth/domain/usecases/delete_user_usecase.dart';
import 'package:shop/features/auth/domain/usecases/login_usecase.dart';
import 'package:shop/features/auth/domain/usecases/logout_usecase.dart';
import 'package:shop/features/auth/domain/usecases/update_user_usercase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AddUserUsercase addUserUsercase;
  final UpdateUserUsercase updateUserUsercase;
  final DeleteUserUsecase deleteUserUsecase;
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  AuthCubit(
      {required this.addUserUsercase,
      required this.deleteUserUsecase,
      required this.loginUsecase,
      required this.updateUserUsercase,
      required this.logoutUsecase})
      : super(AuthInitial());

  Future<void> addUser({required User user}) async {
    emit(AuthLoadingState());
    final result = await addUserUsercase(user);
    result.fold((l) => emit(AuthErrorState(message: l.message)),
        (r) => emit(AuthLoadedState()));
  }

  Future<void> updateUser({required User user}) async {
    emit(AuthLoadingState());
    final result = await updateUserUsercase(user);
    result.fold((l) => emit(AuthErrorState(message: l.message)),
        (r) => emit(AuthLoadedState()));
  }

  Future<void> deleteUser({required int id}) async {
    emit(AuthLoadingState());
    final result = await deleteUserUsecase(id);
    result.fold((l) => emit(AuthErrorState(message: l.message)),
        (r) => emit(AuthLoadedState()));
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());
    final result = await loginUsecase(email, password);
    result.fold((l) => emit(AuthErrorState(message: l.message)),
        (r) => emit(AuthLoadedState()));
  }

  Future<void> logout() async {
    emit(AuthLoadingState());
    final result = await logoutUsecase();
    result.fold((l) => emit(AuthErrorState(message: l.message)),
        (r) => emit(AuthLoadedState()));
  }
}
