import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/hero_handler/hero_handler.dart';
import 'package:shop/core/widgets/star_rating_widget.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/cart/domain/entities/card_product.dart';
import 'package:shop/features/cart/presentation/cubit/cubit/local_cart_cubit.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/home/presentation/widgets/add_to_local_cart_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen(
      {super.key,
      required this.productModal,
      this.updateProductIndex,
      this.quantity});
  final ProductModal productModal;
  final int? updateProductIndex;
  final int? quantity;
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
            updateProductIndex != null
                ? UpdateLocalCartProductWidget(
                    quantity: quantity!,
                    productIndex: updateProductIndex!,
                    productId: productModal.id)
                : AddToLocalCartWidget(
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

class UpdateLocalCartProductWidget extends StatefulWidget {
  UpdateLocalCartProductWidget(
      {super.key,
      required this.quantity,
      required this.productIndex,
      required this.productId});
  int quantity;
  final int productIndex;
  final int productId;
  @override
  State<UpdateLocalCartProductWidget> createState() =>
      _UpdateLocalCartProductWidgetState();
}

class _UpdateLocalCartProductWidgetState
    extends State<UpdateLocalCartProductWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<LocalCartCubit>(),
      child: BlocListener<LocalCartCubit, LocalCartState>(
        listener: (context, state) {
          if (state is LocalCartLoadingState) {
            showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ));
          } else if (state is LocalCartErrorState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          } else if (state is LocalCartLoadedState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Updating process successed'),
              backgroundColor: Colors.green,
            ));
          }
        },
        child: Builder(
          builder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (widget.quantity < 100) {
                          setState(() {
                            widget.quantity++;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 30.w,
                        color: Colors.deepPurple.shade300,
                      )),
                  Text(
                    widget.quantity.toString(),
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                  IconButton(
                      onPressed: () {
                        if (widget.quantity > 1) {
                          setState(() {
                            widget.quantity--;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.remove_circle_outline,
                        size: 30.w,
                        color: Colors.deepPurple.shade300,
                      ))
                ],
              ),
              SizedBox(
                width: 20.w,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  BlocProvider.of<LocalCartCubit>(context).updateLocalCartItem(
                      cartProduct: CartProduct(
                          productId: widget.productId,
                          quantity: widget.quantity),
                      index: widget.productIndex);
                },
                label: const Text('Update'),
                icon: const Icon(Icons.edit),
              )
            ],
          ),
        ),
      ),
    );
  }
}
