import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/constant/app_colors.dart';

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
