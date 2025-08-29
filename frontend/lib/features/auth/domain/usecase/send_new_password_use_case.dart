import 'package:frontend/features/auth/domain/repositories/auth_repository.dart';

class SendNewPasswordUseCase {
  final AuthRepository authRepository;

  SendNewPasswordUseCase({required this.authRepository});

  Future<void> call(String password) {
    return authRepository.sendNewPassword(password);
  }
}
