import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/features/orders/domain/entities/order_details.dart';
import 'package:shop/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:shop/features/orders/presentation/widgets/images_of_order_item_widget.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.orderDetails});
  final OrderDetails orderDetails;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.orderDetailsScreen,
          arguments: orderDetails),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: .5),
        height: .2.sh,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(spreadRadius: 0, blurRadius: 3, color: Colors.grey)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.w,
                  child: Text(
                    orderDetails.user.name.substring(0, 2).toUpperCase(),
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      orderDetails.user.name,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(orderDetails.user.phone,
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                    trailing: Text(
                      DateFormat('yyyy-MM-dd').format(orderDetails.date),
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            Text(
              'total Price   ${orderDetails.totalPrice}\$',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImagesOfOrderItemWidget(
                  products: orderDetails.orderProduct,
                ),
                orderDetails.isShipped
                    ? ElevatedButton.icon(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: Colors.green,
                            disabledForegroundColor: Colors.white),
                        label: const Text('shiped'),
                        icon: const Icon(Icons.local_shipping_rounded),
                      )
                    : ElevatedButton.icon(
                        onPressed: () {
                          BlocProvider.of<OrdersCubit>(context)
                              .shipeOrder(id: orderDetails.cartId);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white),
                        label: const Text('shipe'),
                        icon: const Icon(Icons.local_shipping_rounded),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
