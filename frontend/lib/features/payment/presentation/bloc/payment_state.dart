abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentLoaded extends PaymentState {}

class PaymentError extends PaymentState {
  final String message;
  PaymentError(this.message);
}
