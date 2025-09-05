import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/payment/presentation/bloc/payment_event.dart';
import 'package:frontend/features/payment/presentation/bloc/payment_state.dart';

class Payment extends Bloc<PaymentEvent, PaymentState> {
  Payment(super.initialState);
}
