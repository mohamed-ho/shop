import 'package:flutter/material.dart';
import 'package:shop/features/orders/presentation/widgets/all_orders_widtet.dart';
import 'package:shop/features/orders/presentation/widgets/shiped_order_widget.dart';
import 'package:shop/features/orders/presentation/widgets/un_shiped_order_widget.dart';

class OrdersTabsBarVeiwWidget extends StatelessWidget {
  const OrdersTabsBarVeiwWidget({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(controller: tabController, children: const [
        AllOrdersWidtet(),
        UnShipedOrderWidget(),
        ShipedOrderWidget(),
      ]),
    );
  }
}
