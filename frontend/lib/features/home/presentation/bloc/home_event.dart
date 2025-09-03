import 'package:frontend/features/campaign/data/models/campaign_search_request.dart';

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

class SearchCampaigns extends HomeEvent {
  final CampaignSearchRequest request;

  SearchCampaigns({required this.request});
}

class LoadMoreCampaigns extends HomeEvent {
  final CampaignSearchRequest request;

  LoadMoreCampaigns({required this.request});
}
