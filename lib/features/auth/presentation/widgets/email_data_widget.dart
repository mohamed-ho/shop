import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shop/features/auth/presentation/widgets/custom_text_form_field.dart';

class EmailDataWidget extends StatelessWidget {
  const EmailDataWidget(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.userNameController,
      required this.phoneController});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController userNameController;
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email Data',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        CustomTextFormField(
            hintText: 'Email',
            labelText: 'Email',
            controller: emailController,
            suffixIcon: const Icon(
              Icons.alternate_email_outlined,
              color: Colors.grey,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter you email";
              } else if (!value.contains('@') || !value.contains('.')) {
                return 'please enter valid email';
              }
              return null;
            }),
        CustomTextFormField(
            hintText: 'password',
            labelText: 'passWrod',
            controller: passwordController,
            suffixIcon: const Icon(
              Icons.password,
              color: Colors.grey,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter you password";
              } else if (value.length < 6) {
                return "the password should be at lest 6 characters";
              }
              return null;
            }),
        CustomTextFormField(
            hintText: 'User Name',
            labelText: 'User name  ',
            controller: userNameController,
            suffixIcon: const Icon(
              Icons.person,
              color: Colors.grey,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter you user name";
              } else if (value.length < 3) {
                return 'please enter valid user Name';
              }
              return null;
            }),
        CustomTextFormField(
            hintText: 'Phone Number',
            labelText: "Phone Number",
            maxLength: 11,
            keyBoardType: TextInputType.number,
            suffixIcon: const Icon(
              Icons.phone,
              color: Colors.grey,
            ),
            validator: (value) {
              if (value == null && value!.isEmpty) {
                return "please Enter you Phone number";
              } else if (int.tryParse(value) == null) {
                return "please enter valid number";
              } else if (value.length < 11) {
                return "phone number must be 11 digit";
              } else if (value.substring(0, 2) != '01') {
                return "please enter valid number ";
              }
              return null;
            },
            controller: phoneController),
      ],
    );
  }
}
