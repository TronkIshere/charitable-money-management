import 'package:frontend/features/home/data/models/notification_response.dart';
import 'package:frontend/features/home/domain/repositories/home_repository.dart';

class FetchNotificationsUseCase {
  final HomeRepository homeRepository;
  FetchNotificationsUseCase({required this.homeRepository});

  Future<List<NotificationResponse>> call() {
    return homeRepository.fetchNotifications();
  }
}
