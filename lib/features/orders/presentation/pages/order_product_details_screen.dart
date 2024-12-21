import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/hero_handler/hero_handler.dart';
import 'package:shop/features/orders/domain/entities/order_product.dart';

class OrderProductDetailsScreen extends StatelessWidget {
  const OrderProductDetailsScreen({super.key, required this.orderProduct});
  final OrderProduct orderProduct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: HeroHandler.orderProductImageTag(orderProduct),
                child: CachedNetworkImage(
                  imageUrl: orderProduct.image,
                  height: .5.sh,
                  width: 1.sw,
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Hero(
                    tag: HeroHandler.orderProductTitleTag(orderProduct),
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        orderProduct.title,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Hero(
                    tag: HeroHandler.orderProductDescriptionTag(orderProduct),
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        orderProduct.description,
                        style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'price of pice',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${orderProduct.price}\$',
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Quantity',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${orderProduct.quantity}',
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Total price ${orderProduct.totalPrice}\$',
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
