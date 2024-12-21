import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/widgets/custom_eleveted_button.dart';
import 'package:shop/features/admin/domain/entities/admin.dart';
import 'package:shop/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:shop/features/auth/presentation/widgets/custom_text_form_field.dart';

class CustomAdminBottomSheet extends StatelessWidget {
  CustomAdminBottomSheet({super.key, this.admin});
  final Admin? admin;
  final _formKey = GlobalKey<FormState>();

  final usercontroller = TextEditingController();

  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (admin != null) {
      usercontroller.text = admin!.username;
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: SizedBox(
        height: .5.sh,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                admin == null ? 'Add Account' : 'Update Account',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              CustomTextFormField(
                  hintText: 'User Name',
                  labelText: "username",
                  suffixIcon: const Icon(
                    Icons.person_2_outlined,
                    color: Colors.grey,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter user name";
                    } else if (value.length < 5) {
                      return "user name must be more than 4 character";
                    }
                    return null;
                  },
                  controller: usercontroller),
              CustomTextFormField(
                hintText: 'Enter New password',
                labelText: 'Enter New password',
                suffixIcon: const Icon(
                  Icons.password,
                  color: Colors.grey,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter password";
                  } else if (value.length < 6) {
                    return "user name must be more than 4 character";
                  }
                  return null;
                },
                controller: passwordController,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomElevatedButton(
                  onPressed: () {
                    if (admin != null) {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AdminCubit>(context).updateAdminAccount(
                            Admin(
                                id: admin!.id,
                                username: usercontroller.text,
                                passwrod: passwordController.text));
                        Navigator.pop(context);
                      }
                    } else {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AdminCubit>(context).addAdminAccount(
                            Admin(
                                id: 1,
                                username: usercontroller.text,
                                passwrod: passwordController.text));
                        Navigator.pop(context);
                      }
                    }
                  },
                  buttonText:
                      admin == null ? 'Create Account' : 'Update Account')
            ],
          ),
        ),
      ),
    );
  }
}
