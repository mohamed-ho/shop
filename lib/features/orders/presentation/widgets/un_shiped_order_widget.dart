import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:shop/features/orders/presentation/widgets/shiped_order_widget.dart';

class UnShipedOrderWidget extends StatelessWidget {
  const UnShipedOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<OrdersCubit>()..getUnShippedOrders(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is OrdersErrorState) {
            return Center(
              child: Text('you have error ${state.message}'),
            );
          } else if (state is OrdersLoadedState) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: ListView.builder(
                  itemCount: state.carts.length,
                  itemBuilder: (context, index) => OrderDetailsWidget(
                        cartId: state.carts[index].id,
                      )),
            );
          } else {
            BlocProvider.of<OrdersCubit>(context).getShippedOrders();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
