import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/core/widgets/custom_eleveted_button.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebView extends StatefulWidget {
  const CustomWebView({super.key, required this.pageUrl});
  final String pageUrl;

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  late WebViewController webController;

  bool isSuccess = false;
  bool isLoading = true;
  @override
  void initState() {
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) async {
            if (url.contains('success=true')) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => Skeletonizer(
                        enabled: isLoading,
                        child: AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            'Success payment process',
                            style: TextStyle(
                                fontSize: 22.sp, fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            'Your transaction has been successfully completed',
                            style:
                                TextStyle(fontSize: 16.w, color: Colors.grey),
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      AppRoutes.homeScreen, (route) => true);
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      ));

              final cart = ls<CartLocalDataSource>().getLocalCart();
              await BlocProvider.of<CartCubit>(context).addNewCart(cart!);
              setState(() {
                Navigator.pop(context);
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            'Success payment process',
                            style: TextStyle(
                                fontSize: 22.sp, fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            'Your transaction has been successfully completed',
                            style:
                                TextStyle(fontSize: 16.w, color: Colors.grey),
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      AppRoutes.homeScreen, (route) => true);
                                },
                                child: const Text('OK'))
                          ],
                        ));
              });
            }
          },
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.pageUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isSuccess
        ? const SuccessPaymentWidget()
        : Expanded(
            child: WebViewWidget(
            controller: webController,
          ));
  }
}

class SuccessPaymentWidget extends StatelessWidget {
  const SuccessPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Success payment process',
        style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
      ),
      content: Text(
        'Your transaction has been successfully completed',
        style: TextStyle(fontSize: 16.w, color: Colors.grey),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.homeScreen, (route) => true);
            },
            child: const Text('OK'))
      ],
    );
  }
}
