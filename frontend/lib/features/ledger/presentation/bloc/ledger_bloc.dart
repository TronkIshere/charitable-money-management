import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/ledger/domain/usecase/send_update_account_use_case.dart';
import 'package:frontend/features/ledger/presentation/bloc/ledger_event.dart';
import 'package:frontend/features/ledger/presentation/bloc/ledger_state.dart';

class LedgerBloc extends Bloc<LedgerEvent, LedgerState> {
  final SendUpdateAccountUseCase sendUpdateAccountUseCase;

  LedgerBloc({required this.sendUpdateAccountUseCase}) : super(LedgerInitial()) {
    on<SendUpdateAccountEvent>(_onSendUpdateAccount);
  }

  Future<void> _onSendUpdateAccount(SendUpdateAccountEvent event, Emitter<LedgerState> emit) async {
    emit(LedgerLoading());
    try {
      await sendUpdateAccountUseCase(event.request);
      emit(LedgerSuccess());
    } catch (e) {
      emit(LedgerFailure(e.toString()));
    }
  }
}
