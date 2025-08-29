import 'package:frontend/features/auth/data/models/register_request.dart';
import 'package:frontend/features/auth/domain/entity/user_entity.dart';
import 'package:frontend/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<UserEntity> call(RegisterRequest request) {
    return authRepository.register(request);
  }
}
