import 'package:dartz/dartz.dart';
import 'package:shop/core/failure/failure.dart';

import 'package:shop/features/payment/domain/entities/paying.dart';

abstract class PaymentRepository {
  Future<Either<Failure, String>> pay(Paying paying);
}
