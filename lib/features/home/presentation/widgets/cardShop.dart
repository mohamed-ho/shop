import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/hero_handler/hero_handler.dart';
import 'package:shop/core/widgets/star_rating_widget.dart';
import 'package:shop/features/home/data/models/product_model.dart';


class CardShop extends StatelessWidget {
  CardShop({Key? key, required this.product}) : super(key: key);
  ProductModal product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.productDetailsScreen,
          arguments: [product]),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 5,
                offset: const Offset(1, 1),
                spreadRadius: 0,
              ),
            ]),
            height: 130,
            width: 200,
            child: Card(
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: HeroHandler.productTitleTag(product),
                      child: Text(
                        '${product.title.substring(0, 6)}...',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Hero(
                          tag: HeroHandler.productPriceTag(product),
                          child: Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            StarRatingWidget(
                              rating: product.rate!.rate,
                              starSize: 12.w,
                            ),
                            Text(product.rate!.rate.toString())
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 40,
              top: -40,
              child: Hero(
                tag: HeroHandler.productImageTag(product),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  height: 100,
                  width: 100,
                ),
              )),
        ],
      ),
    );
  }
}
