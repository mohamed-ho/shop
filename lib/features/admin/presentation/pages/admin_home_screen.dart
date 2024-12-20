import 'package:flutter/material.dart';
import 'package:shop/features/admin/presentation/widgets/admin_buttom_navigation_bar.dart';
import 'package:shop/features/admin/presentation/widgets/admin_settings_tab_bar_view.dart';
import 'package:shop/features/admin/presentation/widgets/categories_tab_bar_view.dart';
import 'package:shop/features/admin/presentation/widgets/home_tabs_widget.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeTabsWidget(tabController: tabController),
          AdminHomeTabBarView(tabController: tabController)
        ],
      ),
      bottomNavigationBar: AdminBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}

class AdminHomeTabBarView extends StatelessWidget {
  const AdminHomeTabBarView({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: const [CategoriesTabBarView(), AdminSettingsTabBarView()],
      ),
    );
  }
}
