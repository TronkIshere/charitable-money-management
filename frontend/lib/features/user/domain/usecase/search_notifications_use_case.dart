import 'package:frontend/features/user/data/models/notification_search_request.dart';
import 'package:frontend/features/user/data/models/notification_search_response.dart';
import 'package:frontend/features/user/data/repositories/notification_repository.dart';

class SearchNotificationsUseCase {
  final NotificationRepository repository;

  SearchNotificationsUseCase({required this.repository});

  Future<NotificationSearchResponse> call(NotificationSearchRequest request) {
    return repository.searchNotifications(request);
  }
}
