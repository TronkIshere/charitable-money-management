import 'package:frontend/features/home/data/models/campaign_response.dart';
import 'package:frontend/features/home/data/models/campaign_search_request.dart';
import 'package:frontend/features/home/data/models/campaign_search_response.dart';
import 'package:frontend/features/home/data/models/notification_response.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class NotificationsLoading extends HomeState {}

class NotificationsLoaded extends HomeState {
  final List<NotificationResponse> notifications;
  NotificationsLoaded(this.notifications);
}

class NotificationsError extends HomeState {
  final String message;
  NotificationsError(this.message);
}

class CampaignsLoading extends HomeState {}

class CampaignsLoaded extends HomeState {
  final List<CampaignResponse> campaigns;
  CampaignsLoaded(this.campaigns);
}

class CampaignsError extends HomeState {
  final String message;
  CampaignsError(this.message);
}

class CampaignsSearchLoading extends HomeState {}

class CampaignsSearchLoaded extends HomeState {
  final CampaignSearchResponse searchResponse;
  final List<CampaignResponse> allCampaigns;
  final CampaignSearchRequest request;

  CampaignsSearchLoaded({required this.searchResponse, required this.allCampaigns, required this.request});
}

class CampaignsSearchError extends HomeState {
  final String message;
  CampaignsSearchError(this.message);
}
