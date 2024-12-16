import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/core/server_service/http_service.dart';
import 'package:shop/core/server_service/server_service.dart';
import 'package:shop/features/auth/auth_enjection.dart';
import 'package:shop/features/cart/cart_dependent_enjection.dart';
import 'package:shop/features/home/home_dependent_enjection.dart';
import 'package:shop/features/payment/payment_enjection.dart';

final ls = GetIt.instance;

class DependentEnjection {
  init() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    ls.registerLazySingleton<ServerService>(() => HttpService());
    ls.registerLazySingleton(() => shared);
    HomeDependentEnjection().init();
    CartDependentEnjection().init();
    PaymentEnjection().init();
    AuthEnjection().init();
  }
}
