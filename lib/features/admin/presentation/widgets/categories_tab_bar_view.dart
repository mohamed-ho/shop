import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/admin/presentation/widgets/loaded_category_tab_bar_view_widget.dart';
import 'package:shop/features/home/presentation/cubit/cubit/category_cubit.dart';

class CategoriesTabBarView extends StatelessWidget {
  const CategoriesTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<CategoryCubit>()..getAllCategories(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryErrorState) {
            return Center(child: Text(state.message));
          } else if (state is CategoryGetedState) {
            return LoadedCategoryTabBarViewWidget(categories: state.categories);
          } else if (state is CategoryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            BlocProvider.of<CategoryCubit>(context).getAllCategories();
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
