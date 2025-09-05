import 'package:frontend/features/ledger/data/models/update_account_request.dart';

abstract class LedgerEvent {}

class SendUpdateAccountEvent extends LedgerEvent {
  final UpdateAccountRequest request;
  SendUpdateAccountEvent(this.request);
}
