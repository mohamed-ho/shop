import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shop/features/auth/presentation/pages/login_screen.dart';
import 'package:shop/features/auth/presentation/pages/signup_screen.dart';

import 'package:shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:shop/features/payment/domain/entities/paying.dart';
import 'package:shop/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:shop/features/payment/presentation/screens/add_order_screen.dart';
import 'package:shop/features/cart/presentation/screens/cart_screen.dart';
import 'package:shop/features/cart/presentation/screens/complete_order_screen.dart';

import 'package:shop/features/home/presentation/cubit/cubit/product_cubit.dart';
import 'package:shop/features/home/presentation/screens/home_screen.dart';
import 'package:shop/features/home/presentation/screens/product_details_screen.dart';

class AppRoutes {
  static const String homeScreen = 'Home Screen';
  static const String productDetailsScreen = 'Product Details Screen';
  static const String cartScreen = 'Cart Screen';
  static const String addOrderScreen = 'Add Order Screen';
  static const String completeOrderScreen = 'Complete Order Screen';
  static const String signupScreen = 'signup Screen';
  static const String loginScreen = 'login Screen';

  static Route<dynamic>? routes(RouteSettings route) {
    switch (route.name) {
      case homeScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<ProductCubit>()..getCategories(),
                  child: const HomeScreen(),
                ));
      case cartScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      ls<CartCubit>()..getCartOfMeanUser(userId: 1),
                  child: const CartScreen(),
                ));
      case productDetailsScreen:
        {
          List argument = route.arguments as List<dynamic>;
          return MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                    productModal: argument[0],
                    updateProductIndex:
                        argument.length > 1 ? argument[1] : null,
                    quantity: argument.length > 1 ? argument[2] : null,
                  ));
        }
      case addOrderScreen:
        final paying = route.arguments as Paying;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<PaymentCubit>()..pay(paying: paying),
                  child: AddOrderScreen(
                    paying: paying,
                  ),
                ));
      case completeOrderScreen:
        {
          List argument = route.arguments as List<dynamic>;
          return MaterialPageRoute(
              builder: (context) => CompleteOrderScreen(
                    cart: argument[0],
                    discount: argument.length > 1 ? argument[1] : 0.0,
                    shipping: argument.length > 1 ? argument[2] : 0.0,
                  ));
        }
      case signupScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<AuthCubit>(),
                  child: const SignupScreen(),
                ));
      case loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<AuthCubit>(),
                  child: const LoginScreen(),
                ));
    }
    return null;
  }
}
