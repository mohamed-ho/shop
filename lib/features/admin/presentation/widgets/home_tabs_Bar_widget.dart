import 'package:flutter/material.dart';

class HomeTabsBarWidget extends StatelessWidget {
  const HomeTabsBarWidget({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(controller: tabController, tabs: const [
          Tab(
            child: Text('Categories'),
          ),
          Tab(
            child: Text('adminSettings'),
          ),
        ])
      ],
    );
  }
}
