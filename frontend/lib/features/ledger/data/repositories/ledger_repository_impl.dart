import 'package:frontend/features/ledger/data/datasource/ledger_remote_datasource.dart';
import 'package:frontend/features/ledger/data/models/update_account_request.dart';
import 'package:frontend/features/ledger/domain/repositories/ledger_repository.dart';

class LedgerRepositoryImpl extends LedgerRepository {
  final LedgerRemoteDataSource ledgerRemoteDataSource;
  LedgerRepositoryImpl({required this.ledgerRemoteDataSource});

  @override
  Future<void> sendUpdateAccount(UpdateAccountRequest request) async {
    return await ledgerRemoteDataSource.sendUpdateAccountRequest(request);
  }
}
