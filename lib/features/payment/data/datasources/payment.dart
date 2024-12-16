abstract class Payment {
  /// Function to handle payment.
  /// Each implementation will define its own way of processing the payment.
  Future<String> pay({required double amount, required String currency});
}
