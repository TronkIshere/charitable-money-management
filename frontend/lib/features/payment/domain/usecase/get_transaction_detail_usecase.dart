import 'package:frontend/features/payment/data/models/payment_transaction.dart';
import 'package:frontend/features/payment/domain/repositories/payment_repository.dart';

class GetTransactionDetailUseCase {
  final PaymentRepository paymentRepository;

  GetTransactionDetailUseCase({required this.paymentRepository});

  Future<PaymentTransaction> call(String id) {
    return paymentRepository.getTransactionDetail(id);
  }
}
