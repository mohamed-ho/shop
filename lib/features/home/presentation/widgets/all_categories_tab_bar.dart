import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoriesTabBar extends StatelessWidget {
  const AllCategoriesTabBar({
    super.key,
    required this.onTap,
    required this.isSelected,
  });

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
                    backgroundColor: Colors.grey,
                  ),
                ),
                CircleAvatar(
                    radius: 27.w,
                    backgroundImage:
                        const AssetImage('assets/images/shop.png')),
              ],
            ),
            const Text(
              textAlign: TextAlign.center,
              'All',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
