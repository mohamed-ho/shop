import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/features/payment/data/datasources/paypal_payment.dart';
import 'package:shop/features/payment/data/datasources/wallet_payment.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/cart/presentation/cubit/cubit/local_cart_cubit.dart';
import 'package:shop/features/cart/presentation/widgets/get_product_widget.dart';
import 'package:shop/features/cart/presentation/widgets/product_in_local_cart.dart';

class LocalCartWidget extends StatelessWidget {
  const LocalCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<LocalCartCubit>()..getLocalCart(),
      child: BlocBuilder<LocalCartCubit, LocalCartState>(
        builder: (context, state) {
          if (state is LocalCartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LocalCartErrorState) {
            return ErrorWidget(StateError);
          } else if (state is LocalCartGetedState) {
            if (state.localCart == null) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/empty.png',
                    width: .5.sw,
                    height: .5.sw,
                  ),
                  const Text('There are no Items in The cart')
                ],
              ));
            } else {
              return RefreshIndicator(
                onRefresh: () async =>
                    BlocProvider.of<LocalCartCubit>(context).getLocalCart(),
                child: Scaffold(
                  floatingActionButton: FloatingActionButton(
                    onPressed: () async {
                      Navigator.pushNamed(
                          context, AppRoutes.completeOrderScreen,
                          arguments: [state.localCart, 12.0, 15.4]);
                    },
                    child: const Text('Order'),
                  ),
                  body: ListView.builder(
                      itemCount: state.localCart!.cartProducts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 8.h),
                            child: GetProductWidget(
                                cartProduct:
                                    state.localCart!.cartProducts[index],
                                child: (product) => ProductInLocalCart(
                                    onTap: () => Navigator.pushNamed(
                                            context, AppRoutes.productDetailsScreen,
                                            arguments: [
                                              product,
                                              index,
                                              state.localCart!
                                                  .cartProducts[index].quantity
                                            ]).then((value) =>
                                            BlocProvider.of<LocalCartCubit>(context)
                                                .getLocalCart()),
                                    product: product,
                                    quantity: state.localCart!.cartProducts[index].quantity,
                                    onDismissed: (dismiss) {
                                      BlocProvider.of<LocalCartCubit>(context)
                                          .deleteItemFromLocalCart(
                                              index: index);
                                    })));
                      }),
                ),
              );
            }
          } else {
            BlocProvider.of<LocalCartCubit>(context).getLocalCart();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
