import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/auth/presentation/cubit/auth_cubit.dart';

class CustomDrawerBady extends StatelessWidget {
  const CustomDrawerBady({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ));
          } else if (state is AuthErrorState) {
            Navigator.pop(context);
            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: Text(state.message),
                      actions: [
                        ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'))
                      ],
                    ));
          } else if (state is AuthLoadedState) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.loginScreen, (route) => true);
          }
        },
        child: Builder(builder: (context) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 16.sp),
                ),
                subtitle: Text(
                  'logout from shop market',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                onTap: () {
                  BlocProvider.of<AuthCubit>(context).logout();
                },
              )
            ],
          );
        }),
      ),
    );
  }
}
