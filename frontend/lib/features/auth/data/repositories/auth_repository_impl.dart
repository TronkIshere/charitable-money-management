import 'package:frontend/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:frontend/features/auth/data/models/register_request.dart';
import 'package:frontend/features/auth/domain/entity/otp_entity.dart';
import 'package:frontend/features/auth/domain/entity/user_entity.dart';
import 'package:frontend/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<UserEntity> login(String email, String password) {
    return authRemoteDataSource.login(email: email, password: password);
  }

  @override
  Future<UserEntity> register(RegisterRequest request) {
    return authRemoteDataSource.register(request);
  }

  @override
  Future<OtpEntity> getOTP(String email) {
    return authRemoteDataSource.getOTP(email: email);
  }

  @override
  Future<void> checkOTP(String otp) {
    return authRemoteDataSource.checkOTP(otp: otp);
  }

  @override
  Future<void> sendNewPassword(String password) {
    return authRemoteDataSource.sendNewPassword(password: password);
  }
}
