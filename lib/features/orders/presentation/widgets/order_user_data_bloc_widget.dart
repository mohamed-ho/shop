import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/features/orders/domain/entities/cart_user.dart';

class OrderUserDataBlocWidget extends StatelessWidget {
  const OrderUserDataBlocWidget({super.key, required this.cartUser});
  final CartUser cartUser;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Owner Data',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        CustomOrderUserRichText(title: 'Name: ', content: cartUser.name),
        CustomOrderUserRichText(title: 'Email: ', content: cartUser.email),
        CustomOrderUserRichText(title: 'Address: ', content: cartUser.address),
        CustomOrderUserRichText(title: 'Phone: ', content: cartUser.phone),
      ],
    );
  }
}

class CustomOrderUserRichText extends StatelessWidget {
  const CustomOrderUserRichText(
      {super.key, required this.content, required this.title});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: RichText(
        text: TextSpan(
            text: title,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            children: [
              TextSpan(
                  text: content,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey))
            ]),
      ),
    );
  }
}
