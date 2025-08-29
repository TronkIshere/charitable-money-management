import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/auth/data/models/otp_response.dart';
import 'package:frontend/features/auth/data/models/register_request.dart';
import 'package:frontend/features/auth/data/models/user_response.dart';

class AuthRemoteDataSource {
  ApiClient apiClient;
  AuthRemoteDataSource({required this.apiClient});

  Future<UserResponse> login({required String email, required String password}) async {
    final response = await apiClient.post('/auth/login', {
      'email': email,
      'password': password,
    }, (json) => UserResponse.fromJson(json));
    if (!response.success) throw response.error!;
    return response.result!;
  }

  Future<UserResponse> register(RegisterRequest request) async {
    final response = await apiClient.post('/auth/register', request.toJson(), (json) => UserResponse.fromJson(json));
    if (!response.success) throw response.error!;
    return response.result!;
  }

  Future<OtpResponse> getOTP({required String email}) async {
    final response = await apiClient.post('/auth/forgotPassword/sendEmail', {
      'email': email,
    }, (json) => OtpResponse.fromJson(json));
    if (!response.success) throw response.error!;
    return response.result!;
  }

  Future<void> checkOTP({required String otp}) async {
    final response = await apiClient.post('/auth/forgotPassword/checkOTP', {'otp': otp}, (_) => null);
    if (!response.success) throw response.error!;
  }

  Future<void> sendNewPassword({required String password}) async {
    final response = await apiClient.post('/auth/forgotPassword/newPassword', {'password': password}, (_) => null);
    if (!response.success) throw response.error!;
  }
}
