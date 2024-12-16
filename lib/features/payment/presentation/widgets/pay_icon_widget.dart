import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/constant/app_colors.dart';

// ignore: must_be_immutable
class PayIconWidget extends StatelessWidget {
  PayIconWidget({
    super.key,
    required this.image,
    required this.isChoosed,
  });
  final String image;
  bool isChoosed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: isChoosed ? AppColors.mainAppColor : Colors.grey,
            width: 3.w),
      ),
      child: Image.asset(
        image,
        width: 60.w,
        height: 25.w,
      ),
    );
  }
}
