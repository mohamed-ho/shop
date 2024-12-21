import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/orders/data/models/order_details_model.dart';
import 'package:shop/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:shop/features/orders/presentation/widgets/order_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShipedOrderWidget extends StatelessWidget {
  const ShipedOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<OrdersCubit>()..getShippedOrders(),
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
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: ListView.builder(
                  itemCount: state.carts.length,
                  itemBuilder: (context, index) =>
                      OrderDetailsWidget(cartId: state.carts[index].id)),
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

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    required this.cartId,
  });
  final int cartId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<OrdersCubit>()..getOrderDetails(cartId: cartId),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoadingState) {
            return Center(
              child: Skeletonizer(
                  child: OrderItem(
                orderDetails: _demoOrderDietals,
              )),
            );
          } else if (state is OrdersErrorState) {
            return Center(
              child: Text('you have error ${state.message}'),
            );
          } else if (state is OrdersGetedOrderDetailsState) {
            return OrderItem(orderDetails: state.orderDetails);
          } else {
            BlocProvider.of<OrdersCubit>(context)
                .getOrderDetails(cartId: cartId);
            return Center(
              child: Skeletonizer(
                  child: OrderItem(orderDetails: _demoOrderDietals)),
            );
          }
        },
      ),
    );
  }
}

final _demoOrderDietals = OrderDetailsModel.fromJson({
  "cart_id": 1,
  "date": "2020-03-02",
  "User": {
    "name": "john doe",
    "email": "john@gmail.com",
    "address": "kilcoole new road building number 7682",
    "phone": "1-570-236-7033"
  },
  "products": [
    {
      "id": 1,
      "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      "price": "109.95",
      "description":
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      "quantity": 4,
      "total_price": "439.80"
    },
    {
      "id": 2,
      "title": "Mens Casual Premium Slim Fit T-Shirts ",
      "price": "22.30",
      "description":
          "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
      "image":
          "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
      "quantity": 1,
      "total_price": "22.30"
    },
    {
      "id": 3,
      "title": "Mens Cotton Jacket",
      "price": "55.99",
      "description":
          "great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.",
      "image": "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
      "quantity": 6,
      "total_price": "335.94"
    }
  ],
  "all_total_price": 798.04
});
