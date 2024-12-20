import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/constant/app_colors.dart';
import 'package:shop/core/widgets/custom_eleveted_button.dart';
import 'package:shop/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:shop/features/admin/presentation/widgets/admin_login_bloc_widget.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final passWordController = TextEditingController();
  final userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isHide = true;
  @override
  void dispose() {
    super.dispose();
    passWordController.dispose();
    userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AdminCubit, AdminState>(
        listener: (context, state) {
          print(state);
          if (state is AdminLoadingState) {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                barrierDismissible: true);
          } else if (state is AdminErrorState) {
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: Text(state.message),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'))
                      ],
                    ));
          } else if (state is AdminLoadedState) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.adminHomeScreen, (route) => true);
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  CircleAvatar(
                    radius: .38.sw,
                    backgroundColor: AppColors.mainAppColor.withOpacity(.7),
                    child: Image.asset(
                      'assets/images/admin.png',
                      width: .5.sw,
                      height: .5.sw,
                    ),
                  ),
                  AdminLoginBlocWidget(
                    passWordController: passWordController,
                    userNameController: userNameController,
                    passwordIsHide: isHide,
                    showAndHidePassword: () {
                      setState(() {
                        isHide = !isHide;
                      });
                    },
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await BlocProvider.of<AdminCubit>(context).loginAdmin(
                              username: userNameController.text,
                              password: passWordController.text);
                        }
                      },
                      buttonText: 'Login'),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    buttonText: 'Login As User',
                    icon: const Icon(Icons.arrow_back_rounded),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
