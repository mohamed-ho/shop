import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:shop/features/home/presentation/widgets/custo_drawer_head.dart';
import 'package:shop/features/home/presentation/widgets/custom_drawer_bady.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ls<AuthLocalDataSource>().getUserData();
    return Drawer(
      child: Column(
        children: [CustomDrawerHead(user: user), const CustomDrawerBady()],
      ),
    );
  }
}
