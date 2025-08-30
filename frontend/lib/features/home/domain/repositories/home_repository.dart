import 'package:frontend/features/home/data/models/campaign_response.dart';
import 'package:frontend/features/home/data/models/campaign_search_request.dart';
import 'package:frontend/features/home/data/models/campaign_search_response.dart';
import 'package:frontend/features/home/data/models/notification_response.dart';

abstract class HomeRepository {
  Future<List<NotificationResponse>> fetchNotifications();
  Future<List<CampaignResponse>> fetchCampaigns(List<String> filters);
  Future<void> markNotificationAsRead(String notificationId);
  Future<CampaignSearchResponse> searchCampaigns(CampaignSearchRequest request);
}
