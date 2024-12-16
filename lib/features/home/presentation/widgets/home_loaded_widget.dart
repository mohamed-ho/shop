import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/home/presentation/cubit/cubit/product_cubit.dart';
import 'package:shop/features/home/presentation/widgets/all_product_widget.dart';
import 'package:shop/features/home/presentation/widgets/custom_tab_bar.dart';
import 'package:shop/features/home/presentation/widgets/product_in_category_widget.dart';

class HomeLoadedWidget extends StatefulWidget {
  const HomeLoadedWidget({super.key, required this.category});
  final List<String> category;
  @override
  State<HomeLoadedWidget> createState() => _HomeLoadedWidgetState();
}

class _HomeLoadedWidgetState extends State<HomeLoadedWidget>
    with SingleTickerProviderStateMixin {
  late int controller = 0;
  late List<Widget> body;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          height: 140.h,
          color: Colors.transparent,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: widget.category
                  .map((e) => CustomTabBar(
                      isSelected: controller == widget.category.indexOf(e),
                      onTap: () {
                        setState(() {
                          controller = widget.category.indexOf(e);
                          print(controller);
                        });
                      },
                      text: e))
                  .toList()),
        ),
        Expanded(
            child: [
          const AllProductWidget(),
          ...widget.category.sublist(1).map(
                (e) => BlocProvider(
                  key: ValueKey(e),
                  create: (context) =>
                      ls<ProductCubit>()..getProductInCategory(category: e),
                  child: const ProductInCategoryWidget(),
                ),
              )
        ][controller])
      ],
    );
  }
}
