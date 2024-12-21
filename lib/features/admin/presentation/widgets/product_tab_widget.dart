import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/admin/presentation/widgets/admin_product_item.dart';
import 'package:shop/features/home/presentation/cubit/cubit/product_cubit.dart';

class ProductTabWidget extends StatelessWidget {
  const ProductTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<ProductCubit>()..getAllProducts(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductErrorState) {
            return Center(
              child: Text('you have Error ${state.message}'),
            );
          } else if (state is ProductGetProductsState) {
            return RefreshIndicator(
              onRefresh: () async => ls<ProductCubit>()..getAllProducts(),
              child: Scaffold(
                body: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => AdminProductItem(
                          product: state.products[index],
                          onDismissed: (p0) {
                            print(
                                'id = ${state.products[index].id}=====================================================================');
                            BlocProvider.of<ProductCubit>(context)
                                .deleteProduct(
                                    productId: state.products[index].id);
                          },
                        )),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.addProductScreen);
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            );
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
