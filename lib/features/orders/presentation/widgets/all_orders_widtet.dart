import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:shop/features/orders/presentation/widgets/shiped_order_widget.dart';

class AllOrdersWidtet extends StatelessWidget {
  const AllOrdersWidtet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<CartCubit>()..getAllCarts(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartErrorState) {
            return Center(
              child: Text('you have error ${state.message}'),
            );
          } else if (state is CartGetedCartsState) {
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
            BlocProvider.of<CartCubit>(context).getAllCarts();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
