import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/presentation/widgets/order_total_widget.dart';

class CompleteOrderScreen extends StatelessWidget {
  const CompleteOrderScreen(
      {super.key,
      required this.cart,
      this.discount = 0.0,
      this.shipping = 0.0});
  final Cart cart;
  final double shipping;
  final double discount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/shop.png',
            width: 1.sw,
            height: .6.sh,
          ),
          OrderTotalWidget(cart: cart, discount: discount, shipping: shipping)
        ],
      ),
    );
  }
}
