import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/constant/app_colors.dart';
import 'package:shop/features/auth/presentation/widgets/custom_text_form_field.dart';

class LoginBlocWidget extends StatelessWidget {
  const LoginBlocWidget(
      {super.key,
      required this.passWordController,
      required this.userNameController,
      required this.showAndHidePassword,
      required this.passwordIsHide});
  final TextEditingController userNameController;
  final TextEditingController passWordController;
  final bool passwordIsHide;
  final Function() showAndHidePassword;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            hintText: 'User Name',
            labelText: 'Please Enter User Name',
            suffixIcon: const Icon(
              Icons.person,
              color: Colors.grey,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter user name';
              }
              return null;
            },
            controller: userNameController),
        CustomPasswordTextFormField(
            showAndHidePassword: showAndHidePassword,
            hintText: 'Password',
            labelText: "please Enter you password",
            isHide: passwordIsHide,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter password";
              } else if (value.length < 6) {
                return "password should be at lest 6 characters";
              }
              return null;
            },
            controller: passWordController)
      ],
    );
  }
}

class CustomPasswordTextFormField extends StatelessWidget {
  const CustomPasswordTextFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.isHide,
      required this.validator,
      required this.controller,
      required this.showAndHidePassword,
      this.keyBoardType});
  final String labelText;
  final String hintText;
  final bool isHide;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? keyBoardType;
  final Function() showAndHidePassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          TextFormField(
            keyboardType: keyBoardType,
            controller: controller,
            validator: validator,
            obscureText: isHide,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.w),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.w),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  )),
              errorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16.w)),
              fillColor: AppColors.textfieldcolor,
              filled: true,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: IconButton(
                  onPressed: showAndHidePassword,
                  icon: Icon(isHide ? Icons.visibility : Icons.visibility_off)),
            ),
          ),
        ],
      ),
    );
  }
}
