import 'package:frontend/features/auth/data/models/register_request.dart';
import 'package:frontend/features/auth/domain/entity/otp_entity.dart';
import 'package:frontend/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register(RegisterRequest request);
  Future<OtpEntity> getOTP(String email);
  Future<void> checkOTP(String otp);
  Future<void> sendNewPassword(String password);
}
