import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/enum/payment_enum.dart';
import 'package:shop/core/widgets/custom_eleveted_button.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/home/data/datasources/product_remote_data_source.dart';
import 'package:shop/features/payment/domain/entities/paying.dart';

class OrderTotalWidget extends StatelessWidget {
  const OrderTotalWidget({
    super.key,
    required this.cart,
    required this.discount,
    required this.shipping,
  });

  final Cart cart;
  final double discount;
  final double shipping;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: FutureBuilder(
        future: _getTotalPrice(cart),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final totalPrice = snapshot.data! + shipping - discount;
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Subtotal',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Text(
                      '\$${snapshot.data}',
                      style: TextStyle(fontSize: 16.sp),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Text(
                      '\$$discount',
                      style: TextStyle(fontSize: 16.sp),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Text(
                      '\$$shipping',
                      style: TextStyle(fontSize: 16.sp),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${(snapshot.data! + shipping - discount).toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.addOrderScreen,
                        arguments: Paying(
                            price: totalPrice,
                            products: [],
                            user: ls<AuthLocalDataSource>().getUserData(),
                            paymentType: PaymentEnum.card));
                  },
                  buttonText: 'Complete Payment',
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Future<double> _getTotalPrice(Cart cart) async {
  double result = 0.0;

  for (var cartProduct in cart.cartProducts) {
    final productPrice = await ls<ProductRemoteDataSource>()
        .getSingleProduct(cartProduct.productId);
    result += (productPrice.price * cartProduct.quantity);
  }

  return result;
}
