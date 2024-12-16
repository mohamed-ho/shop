import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/presentation/widgets/product_in_old_cart.dart';
import 'package:shop/features/cart/presentation/widgets/get_product_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cart});
  final Cart cart;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: .25.sh,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('yyyy-MM-dd').format(cart.date),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: cart.cartProducts.map((cartProduct) {
                  return GetProductWidget(
                    child: (product) => ProductInOldCart(
                      product: product,
                      quantity: cartProduct.quantity,
                    ),
                    cartProduct: cartProduct,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
