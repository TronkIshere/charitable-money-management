import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/payment/domain/usecase/get_transaction_detail_usecase.dart';
import 'package:frontend/features/payment/presentation/bloc/payment_event.dart';
import 'package:frontend/features/payment/presentation/bloc/payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final GetTransactionDetailUseCase getTransactionDetailUseCase;

  PaymentBloc({required this.getTransactionDetailUseCase}) : super(PaymentInitial()) {
    on<LoadTransactionDetail>(_onLoadTransactionDetail);
  }

  Future<void> _onLoadTransactionDetail(LoadTransactionDetail event, Emitter<PaymentState> emit) async {
    emit(PaymentLoading());
    try {
      final txn = await getTransactionDetailUseCase(event.transactionId);
      emit(PaymentLoaded(transaction: txn));
    } catch (e) {
      emit(PaymentError("Không thể tải chi tiết giao dịch"));
    }
  }
}
