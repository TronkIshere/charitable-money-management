import 'package:frontend/features/payment/data/datasource/payment_remote_data_source.dart';
import 'package:frontend/features/payment/data/models/payment_transaction.dart';
import 'package:frontend/features/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  final PaymentRemoteDataSource paymentRemoteDataSource;
  PaymentRepositoryImpl({required this.paymentRemoteDataSource});

  @override
  Future<PaymentTransaction> getTransactionDetail(String id) {
    return paymentRemoteDataSource.getTransactionDetail(id);
  }
}
