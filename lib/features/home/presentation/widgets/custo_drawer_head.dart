import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/features/auth/data/models/user_model.dart';

class CustomDrawerHead extends StatelessWidget {
  const CustomDrawerHead({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: .2.sw,
          child: Text(
            user.name.firstName.toUpperCase().substring(0, 2),
            style: TextStyle(fontSize: 65.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          user.username,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          user.email,
          style: TextStyle(fontSize: 14.sp),
        ),
        const Divider()
      ],
    );
  }
}
