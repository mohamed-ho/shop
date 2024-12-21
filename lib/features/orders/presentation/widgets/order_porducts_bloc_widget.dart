import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/features/orders/domain/entities/order_product.dart';
import 'package:shop/features/orders/presentation/widgets/order_product_item_widget.dart';

class OrderPorductsBlocWidget extends StatelessWidget {
  const OrderPorductsBlocWidget({super.key, required this.products});
  final List<OrderProduct> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Products Data',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        ...products.map((e) => OrderProductItemWidget(orderProduct: e))
      ],
    );
  }
}
