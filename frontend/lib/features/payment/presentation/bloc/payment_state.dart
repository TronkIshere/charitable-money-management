import 'package:frontend/features/payment/data/models/payment_transaction.dart';

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentLoaded extends PaymentState {
  final PaymentTransaction transaction;
  PaymentLoaded({required this.transaction});
}

class PaymentError extends PaymentState {
  final String message;
  PaymentError(this.message);
}
