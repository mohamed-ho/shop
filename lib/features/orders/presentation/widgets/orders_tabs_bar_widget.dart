import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/constant/app_colors.dart';

class OrdersTabsBarWidget extends StatelessWidget {
  const OrdersTabsBarWidget({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: AppColors.mainAppColor,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      labelColor: AppColors.mainAppColor,
      dividerHeight: 0,
      tabs: [
        Tab(
          child: Text(
            'All',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Unshipped',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'shipped',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
