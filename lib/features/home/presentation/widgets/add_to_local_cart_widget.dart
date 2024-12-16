import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/cart/domain/entities/card_product.dart';
import 'package:shop/features/cart/presentation/cubit/cubit/local_cart_cubit.dart';
import 'package:shop/features/home/data/models/product_model.dart';

class AddToLocalCartWidget extends StatefulWidget {
  const AddToLocalCartWidget({
    super.key,
    required this.producut,
  });
  final ProductModal producut;

  @override
  State<AddToLocalCartWidget> createState() => _AddToLocalCartWidgetState();
}

class _AddToLocalCartWidgetState extends State<AddToLocalCartWidget> {
  int quantity = 1;

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
              content: Text('adding product successully'),
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
                        if (quantity < 100) {
                          setState(() {
                            quantity++;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 30.w,
                        color: Colors.deepPurple.shade300,
                      )),
                  Text(
                    quantity.toString(),
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                  IconButton(
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
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
                  BlocProvider.of<LocalCartCubit>(context).addToLocalCart(
                      cartProduct: CartProduct(
                          productId: widget.producut.id, quantity: quantity));
                },
                label: const Text('Add To Cart'),
                icon: const Icon(Icons.shopping_cart_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }
}
