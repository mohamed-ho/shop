import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/features/home/presentation/cubit/cubit/product_cubit.dart';
import 'package:shop/features/home/presentation/widgets/home_loaded_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CartFloatingActionButton(),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductErrorState) {
            return Text('you have error ${state.message}');
          } else if (state is ProductGetCategories) {
            return HomeLoadedWidget(category: ['All', ...state.categories]);
          } else {
            BlocProvider.of<ProductCubit>(context).getCategories();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class CartFloatingActionButton extends StatelessWidget {
  const CartFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.cartScreen);
      },
      child: const Icon(Icons.shopping_cart),
    );
  }
}
