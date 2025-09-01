import 'package:frontend/features/home/data/models/notification_response.dart';
import 'package:frontend/features/user/data/models/notification_search_request.dart';
import 'package:frontend/features/user/data/models/notification_search_response.dart';

abstract class NotificationRepository {
  Future<List<NotificationResponse>> fetchNotifications();
  Future<void> markAsRead(String notificationId);
  Future<NotificationSearchResponse> searchNotifications(NotificationSearchRequest request);
}
