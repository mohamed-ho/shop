import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/widgets/custom_eleveted_button.dart';
import 'package:shop/features/auth/domain/entities/address.dart';
import 'package:shop/features/auth/domain/entities/name.dart';
import 'package:shop/features/auth/domain/entities/user.dart';
import 'package:shop/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shop/features/auth/presentation/widgets/address_signup_bloc_widget.dart';

import 'package:shop/features/auth/presentation/widgets/email_data_widget.dart';
import 'package:shop/features/auth/presentation/widgets/name_signup_bloc_widget.dart';
import 'package:shop/features/auth/presentation/widgets/aready_have_account_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailCotroller = TextEditingController();
  final TextEditingController passwordCotroller = TextEditingController();
  final TextEditingController userNameCotroller = TextEditingController();
  final TextEditingController firstNameCotroller = TextEditingController();
  final TextEditingController lastNameCotroller = TextEditingController();
  final TextEditingController cityCotroller = TextEditingController();
  final TextEditingController streetCotroller = TextEditingController();
  final TextEditingController houseNumberCotroller = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailCotroller.dispose();
    passwordCotroller.dispose();
    userNameCotroller.dispose();
    firstNameCotroller.dispose();
    lastNameCotroller.dispose();
    cityCotroller.dispose();
    streetCotroller.dispose();
    houseNumberCotroller.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: BlocListener<AuthCubit, AuthState>(
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
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('adding account is Success'),
                  backgroundColor: Colors.green,
                ));
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  EmailDataWidget(
                    emailController: emailCotroller,
                    passwordController: passwordCotroller,
                    userNameController: userNameCotroller,
                    phoneController: phoneController,
                  ),
                  NameSignupBlocWidget(
                      firstNameController: firstNameCotroller,
                      lastNameController: lastNameCotroller),
                  AddressSignupBlocWidget(
                      cityController: cityCotroller,
                      streetController: streetCotroller,
                      houseNumberController: houseNumberCotroller),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).addUser(
                              user: User(
                                  address: Address(
                                      street: streetCotroller.text,
                                      city: cityCotroller.text,
                                      number:
                                          int.parse(houseNumberCotroller.text)),
                                  email: emailCotroller.text,
                                  id: 1,
                                  name: Name(
                                      firstName: firstNameCotroller.text,
                                      lastName: lastNameCotroller.text),
                                  password: passwordCotroller.text,
                                  phone: phoneController.text,
                                  username: userNameCotroller.text));
                        }
                      },
                      buttonText: 'Sign Up'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const AreadyHaveAccontWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
