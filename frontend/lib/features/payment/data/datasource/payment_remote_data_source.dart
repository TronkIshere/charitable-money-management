import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/payment/data/models/payment_transaction.dart';

class PaymentRemoteDataSource {
  ApiClient apiClient;
  PaymentRemoteDataSource({required this.apiClient});

  Future<PaymentTransaction> getTransactionDetail(String id) async {
    final response = await apiClient.get('/payments/$id', (json) => PaymentTransaction.fromJson(json));
    if (!response.success) throw response.error!;
    return response.result!;
  }
}
