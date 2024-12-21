import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/constant/app_colors.dart';
import 'package:shop/features/admin/presentation/widgets/custom_category_bottom_sheet.dart';
import 'package:shop/features/home/domain/entities/category.dart';
import 'package:shop/features/home/presentation/cubit/cubit/category_cubit.dart';

class LoadedCategoryTabBarViewWidget extends StatelessWidget {
  const LoadedCategoryTabBarViewWidget({super.key, required this.categories});
  final List<ProductCategory> categories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: ListTile(
                  title: Text(categories[index].name),
                  trailing: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          BlocProvider.of<CategoryCubit>(context)
                              .deleteCategory(categoryId: categories[index].id);
                        },
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
                        onTap: () {
                          showBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context) => CustomCategoryBottomSheet(
                                    category: categories[index],
                                  ));
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.green,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  leading: CachedNetworkImage(
                    imageUrl: categories[index].image,
                    width: 60.w,
                    height: 60.w,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )),
            );
          }),
      floatingActionButton: Builder(builder: (ctx) {
        return FloatingActionButton(
          onPressed: () {
            showBottomSheet(
                backgroundColor: Colors.white,
                context: ctx,
                builder: (context) => CustomCategoryBottomSheet());
          },
          backgroundColor: AppColors.mainAppColor,
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}
