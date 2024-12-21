import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/orders/domain/entities/order_details.dart';
import 'package:shop/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:shop/features/orders/presentation/widgets/order_porducts_bloc_widget.dart';
import 'package:shop/features/orders/presentation/widgets/order_user_data_bloc_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.orderDetails});
  final OrderDetails orderDetails;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<OrdersCubit>(),
      child: BlocListener<OrdersCubit, OrdersState>(
        listener: (context, state) {
          if (state is OrdersLoadingState) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ));
          } else if (state is OrdersErrorState) {
            Navigator.pop(context);
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: Text(state.message),
                      actions: [
                        ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'))
                      ],
                    ));
          } else if (state is OrderShipedState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('shipping order Success'),
              backgroundColor: Colors.green,
            ));
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.adminHomeScreen, (route) => true);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Order Detials"),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        DateFormat('yyyy-MM-dd').format(orderDetails.date),
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )),
                  OrderPorductsBlocWidget(
                    products: orderDetails.orderProduct,
                  ),
                  OrderUserDataBlocWidget(cartUser: orderDetails.user),
                  SizedBox(
                    height: 16.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Cart Price ${orderDetails.totalPrice}',
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 16.w,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Builder(
                        builder: (context) => ElevatedButton.icon(
                          onPressed: orderDetails.isShipped
                              ? null
                              : () {
                                  BlocProvider.of<OrdersCubit>(context)
                                      .shipeOrder(id: orderDetails.cartId);
                                },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(200.w, 50.w),
                              disabledBackgroundColor: Colors.green,
                              disabledForegroundColor: Colors.white,
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white),
                          label: Text(
                            orderDetails.isShipped ? 'shiped' : 'shipe',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          icon: Icon(
                            Icons.local_shipping_rounded,
                            size: 30.w,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
