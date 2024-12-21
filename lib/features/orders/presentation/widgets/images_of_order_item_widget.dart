import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/features/orders/domain/entities/order_product.dart';

class ImagesOfOrderItemWidget extends StatelessWidget {
  const ImagesOfOrderItemWidget({super.key, required this.products});
  final List<OrderProduct> products;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: products.length > 4
          ? [
              ...products.sublist(0, 4).map((e) => ClipRRect(
                      child: CachedNetworkImage(
                    imageUrl: e.image,
                    width: .11.sw,
                    height: .11.sw,
                  ))),
              const Text('...')
            ]
          : products
              .map((e) => ClipRRect(
                      child: CachedNetworkImage(
                    imageUrl: e.image,
                    width: .11.sw,
                    height: .11.sw,
                  )))
              .toList(),
    );
  }
}
