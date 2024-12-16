import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/cart/domain/entities/card_product.dart';

import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/home/presentation/cubit/cubit/product_cubit.dart';

class GetProductWidget extends StatelessWidget {
  const GetProductWidget(
      {super.key, required this.cartProduct, required this.child});
  final CartProduct cartProduct;

  final Widget Function(ProductModal product) child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: 200.h,
      child: BlocProvider(
        create: (context) => ls<ProductCubit>()
          ..getSingleProduct(productId: cartProduct.productId),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductgetSingleProductState) {
              return child(state.product);
            } else if (state is ProductErrorState) {
              return const Center(
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
