import 'package:frontend/features/ledger/data/models/update_account_request.dart';
import 'package:frontend/features/ledger/domain/repositories/ledger_repository.dart';

class SendUpdateAccountUseCase {
  final LedgerRepository ledgerRepository;
  SendUpdateAccountUseCase({required this.ledgerRepository});

  Future<void> call(UpdateAccountRequest request) async {
    return await ledgerRepository.sendUpdateAccount(request);
  }
}
