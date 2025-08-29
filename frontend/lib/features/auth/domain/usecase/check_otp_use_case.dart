import 'package:frontend/features/auth/domain/repositories/auth_repository.dart';

class CheckOtpUseCase {
  final AuthRepository authRepository;

  CheckOtpUseCase({required this.authRepository});

  Future<void> call(String otp) {
    return authRepository.checkOTP(otp);
  }
}
