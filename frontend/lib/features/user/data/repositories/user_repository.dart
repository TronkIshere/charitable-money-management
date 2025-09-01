import 'package:frontend/features/user/data/models/user_response.dart';

abstract class UserRepository {
  Future<UserResponse> fetchUserProfile();
}
