import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/routes/app_routes.dart';
import 'package:shop/config/themes/app_theme.dart';
import 'package:shop/dependent_enjection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependentEnjection().init();
  runApp(const Shop());
}

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      child: SafeArea(
        child: MaterialApp(
          theme: AppTheme.appTheme(),
          onGenerateRoute: AppRoutes.routes,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.loginScreen,
        ),
      ),
    );
  }
}
