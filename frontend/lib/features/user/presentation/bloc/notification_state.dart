import 'package:frontend/features/user/data/models/notification_response.dart';
import 'package:frontend/features/user/data/models/notification_search_request.dart';
import 'package:frontend/features/user/data/models/notification_search_response.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationResponse> notifications;
  NotificationLoaded(this.notifications);
}

class NotificationError extends NotificationState {
  final String message;
  NotificationError(this.message);
}

class NotificationMarkedAsRead extends NotificationState {}

class NotificationsSearchLoading extends NotificationState {}

class NotificationsSearchLoaded extends NotificationState {
  final NotificationSearchResponse searchResponse;
  final List<NotificationResponse> allNotifications;
  final NotificationSearchRequest request;

  NotificationsSearchLoaded({required this.searchResponse, required this.allNotifications, required this.request});
}

class NotificationsSearchError extends NotificationState {
  final String message;
  NotificationsSearchError(this.message);
}
