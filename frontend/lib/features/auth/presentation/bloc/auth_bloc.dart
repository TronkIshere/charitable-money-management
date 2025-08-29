import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/features/auth/data/models/register_request.dart';
import 'package:frontend/features/auth/domain/usecase/check_otp_use_case.dart';
import 'package:frontend/features/auth/domain/usecase/get_otp_use_case.dart';
import 'package:frontend/features/auth/domain/usecase/login_use_case.dart';
import 'package:frontend/features/auth/domain/usecase/register_use_case.dart';
import 'package:frontend/features/auth/domain/usecase/send_new_password_use_case.dart';
import 'package:frontend/features/auth/presentation/bloc/auth_event.dart';
import 'package:frontend/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final GetOtpUseCase getOtpUseCase;
  final CheckOtpUseCase checkOtpUseCase;
  final SendNewPasswordUseCase sendNewPasswordUseCase;
  final _storage = FlutterSecureStorage();

  AuthBloc({
    required this.registerUseCase,
    required this.loginUseCase,
    required this.getOtpUseCase,
    required this.checkOtpUseCase,
    required this.sendNewPasswordUseCase,
  }) : super(AuthInitial()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
    on<GetOtpEvent>(_onGetOtp);
    on<CheckOtpEvent>(_onCheckOtp);
    on<SendNewPasswordEvent>(_onSendNewPassword);
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final request = RegisterRequest(
        username: event.username,
        email: event.email,
        password: event.password,
        phoneNumber: event.phoneNumber,
        address: event.address,
        date: event.date!,
        gender: event.gender!,
        avatar: event.avatar!,
      );
      await registerUseCase.call(request);
      emit(AuthSuccess(message: "Registration successful"));
    } catch (e) {
      emit(AuthFailure(error: "Registration failed: $e"));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await loginUseCase(event.email, event.password);
      await _storage.write(key: 'token', value: user.token);
      await _storage.write(key: 'userId', value: user.id);
      emit(AuthSuccess(message: "Login successful"));
    } catch (e) {
      emit(AuthFailure(error: "Login failed"));
    }
  }

  Future<void> _onGetOtp(GetOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await getOtpUseCase(event.email);
      emit(AuthSuccess(message: "OTP sent to email"));
    } catch (e) {
      emit(AuthFailure(error: "Failed to send OTP: $e"));
    }
  }

  Future<void> _onCheckOtp(CheckOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await checkOtpUseCase(event.otp);
      emit(AuthSuccess(message: "OTP verified successfully"));
    } catch (e) {
      emit(AuthFailure(error: "OTP verification failed: $e"));
    }
  }

  Future<void> _onSendNewPassword(SendNewPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await sendNewPasswordUseCase(event.password);
      emit(AuthSuccess(message: "Password changed successfully"));
    } catch (e) {
      emit(AuthFailure(error: "Failed to change password: $e"));
    }
  }
}
