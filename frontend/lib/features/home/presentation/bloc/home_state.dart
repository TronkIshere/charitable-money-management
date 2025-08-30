import 'package:frontend/features/home/data/models/campaign_response.dart';
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
