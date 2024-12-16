import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/widgets/star_rating_widget.dart';
import 'package:shop/features/home/data/models/product_model.dart';

class ProductInLocalCart extends StatelessWidget {
  ProductInLocalCart(
      {Key? key,
      required this.product,
      required this.quantity,
      required this.onTap,
      required this.onDismissed})
      : super(key: key);
  final ProductModal product;
  final int quantity;
  final Function(DismissDirection)? onDismissed;
  final Function() onTap;
  double _swipeProgress = 0.0;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Dismissible(
        onDismissed: onDismissed,
        onUpdate: (details) {
          setState(() {
            _swipeProgress = details.progress;
          });
        },
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red.withOpacity(_swipeProgress),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 35.w,
          ),
        ),
        key: Key(product.id.toString()),
        child: InkWell(
          onTap: onTap,
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
                height: .25.sh,
                width: double.infinity,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title.length > 25
                              ? '${product.title.substring(0, 25)}...'
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
                            Row(
                              children: [
                                const Text('item Price'),
                                SizedBox(
                                  width: 10.w,
                                ),
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
                              text: 'Total Price   ',
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
                  top: -10.h,
                  child: Image.network(
                    product.image,
                    height: 65.h,
                    width: 65.h,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
