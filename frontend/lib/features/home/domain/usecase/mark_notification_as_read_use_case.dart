import 'package:frontend/features/home/domain/repositories/home_repository.dart';

class MarkNotificationAsReadUseCase {
  final HomeRepository homeRepository;

  MarkNotificationAsReadUseCase({required this.homeRepository});

  Future<void> call(String notificationId) {
    return homeRepository.markNotificationAsRead(notificationId);
  }
}
