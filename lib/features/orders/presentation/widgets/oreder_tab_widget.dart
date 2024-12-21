import 'package:flutter/material.dart';
import 'package:shop/features/orders/presentation/widgets/orders_tabs_bar_veiw_widget.dart';
import 'package:shop/features/orders/presentation/widgets/orders_tabs_bar_widget.dart';

class OrederTabWidget extends StatefulWidget {
  const OrederTabWidget({super.key});

  @override
  State<OrederTabWidget> createState() => _OrederTabWidgetState();
}

class _OrederTabWidgetState extends State<OrederTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrdersTabsBarWidget(tabController: tabController),
        OrdersTabsBarVeiwWidget(
          tabController: tabController,
        )
      ],
    );
  }
}
