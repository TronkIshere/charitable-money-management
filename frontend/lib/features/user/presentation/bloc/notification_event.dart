import 'package:frontend/features/user/data/models/notification_search_request.dart';

abstract class NotificationEvent {}

class MarkNotificationAsRead extends NotificationEvent {
  final String notificationId;
  MarkNotificationAsRead(this.notificationId);
}

class LoadNotifications extends NotificationEvent {
  final NotificationSearchRequest request;
  LoadNotifications({required this.request});
}

class LoadMoreNotifications extends NotificationEvent {
  final NotificationSearchRequest request;
  LoadMoreNotifications({required this.request});
}
