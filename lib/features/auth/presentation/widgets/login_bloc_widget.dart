import 'package:flutter/material.dart';
import 'package:shop/features/auth/presentation/widgets/custom_password_text_form_field.dart';
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
