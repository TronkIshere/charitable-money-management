import 'dart:io';

import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/ledger/data/models/update_account_request.dart';

class LedgerRemoteDataSource {
  ApiClient apiClient;
  LedgerRemoteDataSource({required this.apiClient});

  Future<void> sendUpdateAccountRequest(UpdateAccountRequest request) async {
    final response = await apiClient.multipartPost(
      '/users/${request.id}/request',
      fields: request.toFields(),
      files: request.attachments.map((path) => File(path)).toList(),
    );

    if (!response.success) throw response.error!;
  }
}
