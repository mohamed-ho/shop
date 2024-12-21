import 'package:flutter/material.dart';
import 'package:shop/features/admin/presentation/pages/admin_home_screen.dart';
import 'package:shop/features/admin/presentation/widgets/home_tabs_Bar_widget.dart';

class HomeTabWidget extends StatefulWidget {
  const HomeTabWidget({super.key});

  @override
  State<HomeTabWidget> createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTabsBarWidget(tabController: tabController),
        AdminHomeTabBarView(tabController: tabController)
      ],
    );
  }
}
