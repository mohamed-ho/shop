import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/cart/domain/entities/cart.dart';
import 'package:shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:shop/features/cart/presentation/widgets/cart_item_widget.dart';
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
                .getCartOfMeanUser(userId: 1),
            child: Column(
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
                              .getCartOfMeanUser(userId: 1);
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
