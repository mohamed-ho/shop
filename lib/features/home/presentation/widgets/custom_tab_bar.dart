import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/constant/app_colors.dart';
import 'package:shop/features/home/domain/entities/category.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.onTap,
    required this.category,
    required this.isSelected,
  });
  final ProductCategory category;
  final Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80.w,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Visibility(
                  visible: isSelected,
                  child: CircleAvatar(
                    radius: 30.w,
                    backgroundColor: AppColors.mainAppColor,
                  ),
                ),
                CircleAvatar(
                  radius: 27.w,
                  backgroundImage: NetworkImage(category.image),
                ),
              ],
            ),
            Text(
              textAlign: TextAlign.center,
              category.name,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
