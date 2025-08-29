import 'package:frontend/features/auth/domain/entity/user_entity.dart';
import 'package:frontend/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<UserEntity> call(String email, String password) {
    return authRepository.login(email, password);
  }
}
