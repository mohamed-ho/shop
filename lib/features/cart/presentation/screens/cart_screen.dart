import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/features/cart/presentation/cubit/cubit/local_cart_cubit.dart';
import 'package:shop/features/cart/presentation/widgets/local_cart_widget.dart';
import 'package:shop/features/cart/presentation/widgets/old_cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  List<Widget> cartType = [
    const LocalCartWidget(),
    const OldCartWidget(),
  ];
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Icon(Icons.shopping_cart_outlined),
        TabBar(
            controller: controller,
            onTap: (value) => setState(() {}),
            tabs: const [
              Tab(
                text: "Current Cart",
              ),
              Tab(
                text: "Old Cart",
              ),
            ]),
        Expanded(
          child: cartType[controller.index],
        )
      ],
    ));
  }
}
