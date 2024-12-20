import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/constant/app_colors.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/home/presentation/cubit/cubit/category_cubit.dart';

class CategoriesTabBarView extends StatelessWidget {
  const CategoriesTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ls<CategoryCubit>()..getAllCategories(),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryErrorState) {
              return Center(child: Text(state.message));
            } else if (state is CategoryGetedState) {
              return ListView.builder(
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: ListTile(
                          title: Text(state.categories[index].name),
                          trailing: Column(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                          leading: CachedNetworkImage(
                            imageUrl: state.categories[index].image,
                            width: 60.w,
                            height: 60.w,
                            fit: BoxFit.fill,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.mainAppColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
