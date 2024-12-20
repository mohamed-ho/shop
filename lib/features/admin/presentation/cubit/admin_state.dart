part of 'admin_cubit.dart';

abstract class AdminState extends Equatable {
  const AdminState();

  @override
  List<Object> get props => [];
}

class AdminInitial extends AdminState {}

class AdminLoadingState extends AdminState {}

class AdminErrorState extends AdminState {
  final String message;

  const AdminErrorState({required this.message});
}

class AdminLoadedState extends AdminState {}

class AdminGetedState extends AdminState {
  final List<Admin> admins;

  const AdminGetedState({required this.admins});
}
