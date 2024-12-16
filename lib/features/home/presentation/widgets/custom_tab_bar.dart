import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.onTap,
    required this.text,
    required this.isSelected,
  });
  final String text;
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
                  backgroundImage: AssetImage('assets/images/$text.jpg'),
                ),
              ],
            ),
            Text(
              textAlign: TextAlign.center,
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
