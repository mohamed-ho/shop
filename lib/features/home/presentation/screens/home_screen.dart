import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/features/home/presentation/cubit/cubit/category_cubit.dart';
import 'package:shop/features/home/presentation/widgets/drawer_widget.dart';
import 'package:shop/features/home/presentation/widgets/home_loaded_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      floatingActionButton: const CartFloatingActionButton(),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryErrorState) {
            return Text('you have error ${state.message}');
          } else if (state is CategoryGetedState) {
            return HomeLoadedWidget(category: state.categories);
          } else {
            BlocProvider.of<CategoryCubit>(context).getAllCategories();
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

final demoCategories = [
  'fsdfsdf sdf ',
  'fsdfsdf sdf ',
  'fsdfsdf sdf ',
  'fsdfsdf sdf ',
  'fsdfsdf sdf ',
  'fsdfsdf sdf ',
  'fsdfsdf sdf ',
];
