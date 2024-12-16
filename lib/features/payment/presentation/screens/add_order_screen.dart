import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/constant/app_colors.dart';
import 'package:shop/core/enum/payment_enum.dart';
import 'package:shop/features/payment/domain/entities/paying.dart';
import 'package:shop/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:shop/features/payment/presentation/widgets/custom_web_view.dart';
import 'package:shop/features/payment/presentation/widgets/pay_icon_widget.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key, required this.paying});
  final Paying paying;
  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isLoading = true;
  bool pageLoading = true;
  late String pageUrl;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Payment Details',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: TabBar(
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                controller: tabController,
                onTap: (value) async {
                  if (pageLoading) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('please wait until end loading'),
                      backgroundColor: AppColors.mainAppColor,
                    ));
                  } else {
                    switch (value) {
                      case 0:
                        {
                          widget.paying.paymentType = PaymentEnum.card;
                          await BlocProvider.of<PaymentCubit>(context)
                              .pay(paying: widget.paying);
                          setState(() {});
                        }
                      case 1:
                        {
                          widget.paying.paymentType = PaymentEnum.wallet;
                          await BlocProvider.of<PaymentCubit>(context)
                              .pay(paying: widget.paying);
                          setState(() {});
                        }
                    }
                  }
                },
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabs: [
                  PayIconWidget(
                    image: 'assets/images/card.png',
                    isChoosed: tabController.index == 0,
                  ),
                  PayIconWidget(
                    image: 'assets/images/wallet.png',
                    isChoosed: tabController.index == 1,
                  ),
                ],
              ),
            ),
            BlocListener<PaymentCubit, PaymentState>(
                listener: (context, state) {
                  if (state is PaymentErrorState) {
                    setState(() {
                      isLoading = false;
                    });
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Eror'),
                              content: Text(state.message),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      switch (tabController.index) {
                                        case 0:
                                          {
                                            widget.paying.paymentType =
                                                PaymentEnum.card;
                                            BlocProvider.of<PaymentCubit>(
                                                    context)
                                                .pay(paying: widget.paying);
                                            setState(() {});
                                          }
                                        case 1:
                                          {
                                            widget.paying.paymentType =
                                                PaymentEnum.wallet;
                                            BlocProvider.of<PaymentCubit>(
                                                    context)
                                                .pay(paying: widget.paying);
                                            setState(() {});
                                          }
                                        case 2:
                                          {
                                            widget.paying.paymentType =
                                                PaymentEnum.paypal;
                                            BlocProvider.of<PaymentCubit>(
                                                    context)
                                                .pay(paying: widget.paying);
                                            setState(() {});
                                          }
                                      }
                                    },
                                    child: const Text('try Again'))
                              ],
                            ));
                  } else if (state is PaymetnLoadedState) {
                    setState(() {
                      pageUrl = state.pageUrl;
                      isLoading = false;
                    });
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                  }
                },
                child: isLoading
                    ? const Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : Expanded(
                        child: CustomWebView(
                          key: Key(pageUrl),
                          pageUrl: pageUrl,
                        ),
                      )),
          ],
        ));
  }
}
