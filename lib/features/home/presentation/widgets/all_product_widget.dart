import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/home/presentation/cubit/cubit/product_cubit.dart';
import 'package:shop/features/home/presentation/widgets/custom_grid_view.dart';
import 'package:shop/features/home/presentation/widgets/product_in_category_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AllProductWidget extends StatelessWidget {
  const AllProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<ProductCubit>()..getAllProducts(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return Skeletonizer(child: CustomGridView(products: list));
          } else if (state is ProductErrorState) {
            return const Center(
              child: Text('there are error'),
            );
          } else if (state is ProductGetProductsState) {
            return CustomGridView(products: state.products);
          } else {
            BlocProvider.of<ProductCubit>(context).getAllProducts();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
