import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/constant/app_colors.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/admin/presentation/cubit/admin_cubit.dart';

class AdminSettingsTabBarView extends StatelessWidget {
  const AdminSettingsTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ls<AdminCubit>()..getAllAdmins(),
        child: BlocBuilder<AdminCubit, AdminState>(
          builder: (context, state) {
            if (state is AdminGetedState) {
              return ListView.builder(
                  itemCount: state.admins.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(state.admins[index].username),
                        trailing: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.edit,
                                color: Colors.green,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (state is AdminErrorState) {
              return const Center(
                child: Text('you have error'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.mainAppColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
