import 'package:dartz/dartz.dart';
import 'package:shop/core/enum/payment_enum.dart';
import 'package:shop/core/failure/failure.dart';
import 'package:shop/features/auth/domain/entities/user.dart';
import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/payment/domain/entities/paying.dart';

abstract class PaymentRepository {
  Future<Either<Failure, String>> pay(Paying paying);
}
