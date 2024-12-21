import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/constant/app_colors.dart';
import 'package:shop/features/admin/domain/entities/admin.dart';
import 'package:shop/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:shop/features/admin/presentation/widgets/custom_admin_bottom_sheet.dart';

class LoadedAdminSettingsTabBarView extends StatelessWidget {
  const LoadedAdminSettingsTabBarView({super.key, required this.admins});
  final List<Admin> admins;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: admins.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(admins[index].username),
                  trailing: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          BlocProvider.of<AdminCubit>(context)
                              .deleteAdminAccount(admins[index].id);
                        },
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
                        onTap: () {
                          showBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context) {
                                return CustomAdminBottomSheet(
                                  admin: admins[index],
                                );
                              });
                        },
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
            }),
        floatingActionButton: Builder(builder: (ctx) {
          return FloatingActionButton(
            onPressed: () {
              showBottomSheet(
                  backgroundColor: Colors.white,
                  context: ctx,
                  builder: (context) {
                    return CustomAdminBottomSheet();
                  });
            },
            backgroundColor: AppColors.mainAppColor,
            child: const Icon(Icons.add),
          );
        }));
  }
}
