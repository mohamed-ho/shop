import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/constant/app_colors.dart';

class AreadyHaveAccontWidget extends StatelessWidget {
  const AreadyHaveAccontWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Aready I have an Account ',
          style: TextStyle(fontSize: 14.sp, color: Colors.black),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Text('Login',
              style: TextStyle(
                  color: AppColors.mainAppColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp)),
        )
      ],
    );
  }
}
