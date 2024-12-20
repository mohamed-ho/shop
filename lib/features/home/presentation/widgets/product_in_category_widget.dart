import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/home/data/models/rate_model.dart';
import 'package:shop/features/home/presentation/cubit/cubit/product_cubit.dart';
import 'package:shop/features/home/presentation/widgets/custom_grid_view.dart';
import 'package:shop/features/home/presentation/widgets/cardShop.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductInCategoryWidget extends StatelessWidget {
  const ProductInCategoryWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
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
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

final list = [
  ProductModal(
      id: 1,
      title: 'dfdsfsdf dsf sdf sdf ',
      rate: RateModel(rate: 3.3, count: 323),
      price: 33.3,
      description: 'dsfsdfsdaf sdf sdf sd fasdf s',
      category: 1,
      image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
  ProductModal(
      id: 1,
      rate: RateModel(rate: 3.3, count: 323),
      title: 'dfdsfsdf dsf sdf sdf ',
      price: 33.3,
      description: 'dsfsdfsdaf sdf sdf sd fasdf s',
      category: 1,
      image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
  ProductModal(
      id: 1,
      rate: RateModel(rate: 3.3, count: 323),
      title: 'dfdsfsdf dsf sdf sdf ',
      price: 33.3,
      description: 'dsfsdfsdaf sdf sdf sd fasdf s',
      category: 1,
      image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
  ProductModal(
      id: 1,
      rate: RateModel(rate: 3.3, count: 323),
      title: 'dfdsfsdf dsf sdf sdf ',
      price: 33.3,
      description: 'dsfsdfsdaf sdf sdf sd fasdf s',
      category: 1,
      image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
  ProductModal(
      id: 1,
      title: 'dfdsfsdf dsf sdf sdf ',
      price: 33.3,
      rate: RateModel(rate: 3.3, count: 323),
      description: 'dsfsdfsdaf sdf sdf sd fasdf s',
      category: 1,
      image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
  ProductModal(
      id: 1,
      title: 'dfdsfsdf dsf sdf sdf ',
      price: 33.3,
      rate: RateModel(rate: 3.3, count: 323),
      description: 'dsfsdfsdaf sdf sdf sd fasdf s',
      category: 1,
      image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
  ProductModal(
      id: 1,
      title: 'dfdsfsdf dsf sdf sdf ',
      price: 33.3,
      rate: RateModel(rate: 3.3, count: 323),
      description: 'dsfsdfsdaf sdf sdf sd fasdf s',
      category: 1,
      image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
  ProductModal(
      id: 1,
      title: 'dfdsfsdf dsf sdf sdf ',
      price: 33.3,
      rate: RateModel(rate: 3.3, count: 323),
      description: 'dsfsdfsdaf sdf sdf sd fasdf s',
      category: 1,
      image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
];
