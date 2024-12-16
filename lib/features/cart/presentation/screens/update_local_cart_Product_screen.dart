import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/hero_handler/hero_handler.dart';
import 'package:shop/core/widgets/star_rating_widget.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/home/presentation/widgets/add_to_local_cart_widget.dart';

class UpdateLocalCartProductScreen extends StatelessWidget {
  const UpdateLocalCartProductScreen({super.key, required this.productModal});
  final ProductModal productModal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: HeroHandler.productImageTag(productModal),
                child: CachedNetworkImage(
                  imageUrl: productModal.image,
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
                    tag: HeroHandler.productTitleTag(productModal),
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        productModal.title,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                          tag: HeroHandler.productPriceTag(productModal),
                          child: Material(
                            type: MaterialType.transparency,
                            child: Text(
                              "Price = ${productModal.price}\$",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(.5)),
                            ),
                          )),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("${productModal.rate!.rate}"),
                              StarRatingWidget(
                                rating: productModal.rate!.rate,
                              ),
                            ],
                          ),
                          Text(
                            '${productModal.rate!.count} person',
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    productModal.description,
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            AddToLocalCartWidget(
              producut: productModal,
            ),
            SizedBox(
              height: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
