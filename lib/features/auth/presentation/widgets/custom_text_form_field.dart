import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/constant/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.suffixIcon,
      required this.validator,
      required this.controller,
      this.maxLength,
      this.keyBoardType});
  final String labelText;
  final String hintText;
  final Icon suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? keyBoardType;
  final int? maxLength;
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
            maxLength: maxLength,
            keyboardType: keyBoardType,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.w),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.w),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.w),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  )),
              fillColor: AppColors.textfieldcolor,
              filled: true,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
