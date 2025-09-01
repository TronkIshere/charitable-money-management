import 'package:frontend/features/user/data/repositories/notification_repository.dart';

class MarkNotificationAsReadUseCase {
  final NotificationRepository notificationRepository;

  MarkNotificationAsReadUseCase({required this.notificationRepository});

  Future<void> call(String id) {
    return notificationRepository.markAsRead(id);
  }
}
