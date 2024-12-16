import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/constant/app_colors.dart';

class DoNotHaveAccountWidget extends StatelessWidget {
  const DoNotHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'I don\'t have an Account ',
          style: TextStyle(fontSize: 14.sp, color: Colors.black),
        ),
        InkWell(
          onTap: () => Navigator.pushNamed(context, AppRoutes.signupScreen),
          child: Text('Signup',
              style: TextStyle(
                  color: AppColors.mainAppColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp)),
        )
      ],
    );
  }
}
