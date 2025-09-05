abstract class LedgerState {}

class LedgerInitial extends LedgerState {}

class LedgerLoading extends LedgerState {}

class LedgerSuccess extends LedgerState {}

class LedgerFailure extends LedgerState {
  final String message;
  LedgerFailure(this.message);
}
