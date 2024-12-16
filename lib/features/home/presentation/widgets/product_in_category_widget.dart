import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/home/presentation/cubit/cubit/product_cubit.dart';
import 'package:shop/features/home/presentation/widgets/custom_grid_view.dart';
import 'package:shop/widget/cardShop.dart';

class ProductInCategoryWidget extends StatelessWidget {
  const ProductInCategoryWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductErrorState) {
          return const Center(
            child: Text('there are error'),
          );
        } else if (state is ProductGetProductsState) {
          return CustomGridView(products: state.products);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
