import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/widgets/star_rating_widget.dart';
import 'package:shop/features/home/data/models/product_model.dart';

class ProductInOldCart extends StatelessWidget {
  const ProductInOldCart(
      {super.key,
      required this.product,
      required this.quantity,
      this.height,
      this.widht});
  final ProductModal product;
  final int quantity;
  final double? height;
  final double? widht;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
          height: height ?? 130.h,
          width: widht ?? 200.h,
          child: Card(
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.title.length > 15
                        ? '${product.title.substring(0, 15)}...'
                        : product.title,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      StarRatingWidget(
                        rating: product.rate!.rate,
                        starSize: 15.w,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(product.rate!.rate.toString())
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text('item Price'),
                          Text(
                            '${product.price}\$',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text('quantity'),
                          Text(
                            '$quantity',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: 'Total Price  = ',
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                      text: '${quantity * product.price} \$',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    )
                  ]))
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 10.h,
          top: -5.h,
          child: Image.network(
            product.image,
            height: 50.h,
            width: 50.h,
          ),
        ),
      ],
    );
  }
}
