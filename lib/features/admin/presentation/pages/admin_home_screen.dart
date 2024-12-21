import 'package:flutter/material.dart';
import 'package:shop/features/admin/presentation/widgets/admin_buttom_navigation_bar.dart';
import 'package:shop/features/admin/presentation/widgets/admin_settings_tab_bar_view.dart';
import 'package:shop/features/admin/presentation/widgets/categories_tab_bar_view.dart';
import 'package:shop/features/admin/presentation/widgets/home_tab_widget.dart';
import 'package:shop/features/admin/presentation/widgets/home_tabs_Bar_widget.dart';
import 'package:shop/features/admin/presentation/widgets/product_tab_widget.dart';
import 'package:shop/features/orders/presentation/widgets/oreder_tab_widget.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  List<Widget> tabs = [
    const HomeTabWidget(),
    const OrederTabWidget(),
    const ProductTabWidget(),
    const Text('profile')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
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
