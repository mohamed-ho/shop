import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:shop/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:shop/features/cart/presentation/widgets/empty_cart_widget.dart';
import 'package:shop/features/cart/presentation/widgets/search_range_widget.dart';

class OldCartWidget extends StatefulWidget {
  const OldCartWidget({super.key});

  @override
  State<OldCartWidget> createState() => _OldCartWidgetState();
}

class _OldCartWidgetState extends State<OldCartWidget> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartGetedCartsState) {
          return RefreshIndicator(
            onRefresh: () async => BlocProvider.of<CartCubit>(context)
                .getCartOfMeanUser(
                    userId: ls<AuthLocalDataSource>().getUserData().id),
            child: state.carts.isEmpty
                ? const EmptyCartWidget()
                : Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                isSearch = !isSearch;
                              });
                              if (!isSearch) {
                                BlocProvider.of<CartCubit>(context)
                                    .getCartOfMeanUser(
                                        userId: ls<AuthLocalDataSource>()
                                            .getUserData()
                                            .id);
                              }
                            },
                            icon: isSearch
                                ? const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  )
                                : const Icon(Icons.search)),
                      ),
                      isSearch ? const SearchRangeWidget() : const SizedBox(),
                      Expanded(
                        child: ListView.builder(
                            itemCount: state.carts.length,
                            itemBuilder: (context, index) {
                              return CartItemWidget(cart: state.carts[index]);
                            }),
                      ),
                    ],
                  ),
          );
        } else if (state is CartErrorState) {
          return Center(
            child: ErrorWidget(Exception(state.message)),
          );
        } else if (state is CartLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          BlocProvider.of<CartCubit>(context).getCartOfMeanUser(
              userId: ls<AuthLocalDataSource>().getUserData().id);
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
