import 'package:frontend/features/user/data/repositories/notification_repository.dart';

class MarkNotificationAsReadUseCase {
  final NotificationRepository repository;

  MarkNotificationAsReadUseCase({required this.repository});

  Future<void> call(String id) {
    return repository.markAsRead(id);
  }
}
