import 'package:frontend/features/user/data/models/notification_response.dart';
import 'package:frontend/features/user/data/repositories/notification_repository.dart';

class FetchNotificationsUseCase {
  final NotificationRepository notificationRepository;

  FetchNotificationsUseCase({required this.notificationRepository});

  Future<List<NotificationResponse>> call() {
    return notificationRepository.fetchNotifications();
  }
}
