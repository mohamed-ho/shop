import 'package:flutter/material.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/home/presentation/widgets/cardShop.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.products});
  final List<ProductModal> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 50,
        ),
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {},
            child: CardShop(
              product: products[index],
            )));
  }
}
