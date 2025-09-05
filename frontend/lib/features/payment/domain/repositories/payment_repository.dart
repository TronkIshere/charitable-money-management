import 'package:frontend/features/payment/data/models/payment_transaction.dart';

abstract class PaymentRepository {
  Future<PaymentTransaction> getTransactionDetail(String id);
}
