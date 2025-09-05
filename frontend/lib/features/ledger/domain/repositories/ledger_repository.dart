import 'package:frontend/features/ledger/data/models/update_account_request.dart';

abstract class LedgerRepository {
  Future<void> sendUpdateAccount(UpdateAccountRequest request);
}
