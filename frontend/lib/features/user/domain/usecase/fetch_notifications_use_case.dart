import 'package:frontend/features/home/data/models/notification_response.dart';
import 'package:frontend/features/user/data/repositories/notification_repository.dart';

class FetchNotificationsUseCase {
  final NotificationRepository repository;

  FetchNotificationsUseCase({required this.repository});

  Future<List<NotificationResponse>> call() {
    return repository.fetchNotifications();
  }
}
