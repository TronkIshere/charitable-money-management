import 'package:frontend/features/user/data/models/user_response.dart';
import 'package:frontend/features/user/data/repositories/user_repository.dart';

class FetchUserProfileUseCase {
  final UserRepository userRepository;
  FetchUserProfileUseCase({required this.userRepository});

  Future<UserResponse> call() {
    return userRepository.fetchUserProfile();
  }
}
