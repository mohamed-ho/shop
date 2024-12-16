import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:shop/features/payment/domain/repositories/payment_repository.dart';
import 'package:shop/features/payment/domain/usecases/pay_usecase.dart';
import 'package:shop/features/payment/presentation/cubit/payment_cubit.dart';

class PaymentEnjection {
  init() {
    ls.registerFactory(() => PaymentCubit(payUsecase: ls()));

    ls.registerLazySingleton(() => PayUsecase(paymentRepository: ls()));

    ls.registerLazySingleton<PaymentRepository>(() => PaymentRepositoryImpl());
  }
}
