import 'package:frontend/features/user/data/datasource/user_remote_data_source.dart';
import 'package:frontend/features/user/data/models/user_response.dart';
import 'package:frontend/features/user/data/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});

  @override
  Future<UserResponse> fetchUserProfile() {
    return userDataSource.fetchUserProfile();
  }
}
