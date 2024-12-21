import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:shop/features/admin/presentation/widgets/loaded_admin_settings_tab_bar_view.dart';

class AdminSettingsTabBarView extends StatelessWidget {
  const AdminSettingsTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<AdminCubit>()..getAllAdmins(),
      child: BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          if (state is AdminGetedState) {
            return LoadedAdminSettingsTabBarView(
              admins: state.admins,
            );
          } else if (state is AdminErrorState) {
            return Center(
              child: Text('you have error ${state.message}'),
            );
          } else if (state is AdminLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            BlocProvider.of<AdminCubit>(context).getAllAdmins();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
