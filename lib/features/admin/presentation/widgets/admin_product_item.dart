import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/hero_handler/hero_handler.dart';
import 'package:shop/core/widgets/star_rating_widget.dart';
import 'package:shop/features/home/data/models/product_model.dart';

class AdminProductItem extends StatelessWidget {
  const AdminProductItem(
      {super.key, required this.product, required this.onDismissed});
  final ProductModal product;
  final Function(DismissDirection) onDismissed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.updateProductScreen,
          arguments: product),
      child: Dismissible(
        key: Key(product.id.toString()),
        onDismissed: onDismissed,
        onUpdate: (details) {},
        background: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.red),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 35.w,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5,
              offset: const Offset(1, 1),
              spreadRadius: 0,
            ),
          ]),
          child: Card(
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Hero(
                              tag: HeroHandler.productTitleTag(product),
                              child: Text(
                                product.title,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              product.description,
                              maxLines: 2,
                            )
                          ],
                        ),
                      ),
                      Hero(
                        tag: HeroHandler.productImageTag(product),
                        child: CachedNetworkImage(
                          imageUrl: product.image,
                          height: 100,
                          width: 100,
                        ),
                      )
                    ],
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
      ),
    );
  }
}
