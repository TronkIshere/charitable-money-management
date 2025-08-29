import 'package:frontend/features/auth/domain/entity/otp_entity.dart';
import 'package:frontend/features/auth/domain/repositories/auth_repository.dart';

class GetOtpUseCase {
  final AuthRepository authRepository;

  GetOtpUseCase({required this.authRepository});

  Future<OtpEntity> call(String email) {
    return authRepository.getOTP(email);
  }
}
