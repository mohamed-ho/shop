part of 'payment_cubit.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoadingState extends PaymentState {}

class PaymentErrorState extends PaymentState {
  final String message;

  const PaymentErrorState({required this.message});
}

class PaymetnLoadedState extends PaymentState {
  final String pageUrl;

  const PaymetnLoadedState({required this.pageUrl});
}
