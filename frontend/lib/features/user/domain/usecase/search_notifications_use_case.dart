import 'package:frontend/features/user/data/models/notification_search_request.dart';
import 'package:frontend/features/user/data/models/notification_search_response.dart';
import 'package:frontend/features/user/data/repositories/notification_repository.dart';

class SearchNotificationsUseCase {
  final NotificationRepository notificationRepository;

  SearchNotificationsUseCase({required this.notificationRepository});

  Future<NotificationSearchResponse> call(NotificationSearchRequest request) {
    return notificationRepository.searchNotifications(request);
  }
}
