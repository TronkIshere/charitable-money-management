abstract class HomeEvent {}

class FetchCampaigns extends HomeEvent {
  final List<String> filters;
  FetchCampaigns(this.filters);
}

class FetchNotifications extends HomeEvent {}

class MarkNotificationAsRead extends HomeEvent {
  final String notificationId;
  MarkNotificationAsRead(this.notificationId);
}
