import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/hero_handler/hero_handler.dart';
import 'package:shop/features/orders/domain/entities/order_product.dart';

class OrderProductItemWidget extends StatelessWidget {
  const OrderProductItemWidget({super.key, required this.orderProduct});
  final OrderProduct orderProduct;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
          context, AppRoutes.orderProductDetailsScreen,
          arguments: orderProduct),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              offset: Offset(1, 1),
              color: Colors.grey,
              blurRadius: 3,
              spreadRadius: 1)
        ]),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 8.h, right: .15.sw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: HeroHandler.orderProductTitleTag(orderProduct),
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        orderProduct.title,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Hero(
                    tag: HeroHandler.orderProductDescriptionTag(orderProduct),
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        orderProduct.description,
                        maxLines: 2,
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ),
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
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Quantity',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
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
                  Text(
                    'Total price ${orderProduct.totalPrice}\$',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Positioned(
                top: -15.h,
                right: -15.w,
                child: Hero(
                  tag: HeroHandler.orderProductImageTag(orderProduct),
                  child: CachedNetworkImage(
                    imageUrl: orderProduct.image,
                    width: .2.sw,
                    height: .2.sw,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
