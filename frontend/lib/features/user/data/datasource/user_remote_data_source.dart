import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/user/data/models/user_response.dart';

class UserRemoteDataSource {
  final ApiClient apiClient;
  UserRemoteDataSource({required this.apiClient});

  Future<UserResponse> fetchUserProfile() async {
    final response = await apiClient.get<UserResponse>('/api/user/me', (json) => UserResponse.fromJson(json));
    if (!response.success) throw response.error!;
    return response.result!;
  }
}
