import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/payment/domain/entities/paying.dart';
import 'package:shop/features/payment/domain/repositories/payment_repository.dart';

class PayUsecase {
  final PaymentRepository paymentRepository;

  PayUsecase({required this.paymentRepository});
  Future<Either<Failure, String>> call(Paying paying) async {
    return await paymentRepository.pay(paying);
  }
}
