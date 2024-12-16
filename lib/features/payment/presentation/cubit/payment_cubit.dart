import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/payment/domain/entities/paying.dart';
import 'package:shop/features/payment/domain/usecases/pay_usecase.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PayUsecase payUsecase;

  PaymentCubit({required this.payUsecase}) : super(PaymentInitial());

  Future<void> pay({required Paying paying}) async {
    emit(PaymentLoadingState());
    final result = await payUsecase(paying);
    result.fold((l) => emit(PaymentErrorState(message: l.message)),
        (r) => emit(PaymetnLoadedState(pageUrl: r)));
  }
}
