abstract class PaymentEvent {}

class LoadTransactionDetail extends PaymentEvent {
  final String transactionId;
  LoadTransactionDetail({required this.transactionId});
}
