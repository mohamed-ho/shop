import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/constant/app_colors.dart';
import 'package:shop/core/widgets/custom_eleveted_button.dart';
import 'package:shop/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shop/features/auth/presentation/widgets/do_not_have_account_widget.dart';
import 'package:shop/features/auth/presentation/widgets/login_bloc_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                barrierDismissible: true);
          } else if (state is AuthErrorState) {
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
          } else if (state is AuthLoadedState) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.homeScreen, (route) => true);
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
                      'assets/images/shop.png',
                      width: .5.sw,
                      height: .5.sw,
                    ),
                  ),
                  LoginBlocWidget(
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).login(
                              email: userNameController.text,
                              password: passWordController.text);
                        }
                      },
                      buttonText: 'Login'),
                  SizedBox(
                    height: 16.h,
                  ),
                  const DoNotHaveAccountWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
