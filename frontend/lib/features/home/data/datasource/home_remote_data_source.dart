import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/home/data/models/campaign_response.dart';
import 'package:frontend/features/home/data/models/campaign_search_request.dart';
import 'package:frontend/features/home/data/models/campaign_search_response.dart';
import 'package:frontend/features/home/data/models/notification_response.dart';

class HomeRemoteDataSource {
  ApiClient apiClient;
  HomeRemoteDataSource({required this.apiClient});

  Future<List<NotificationResponse>> fetchNotifications() async {
    final response = await apiClient.get(
      '/notifications/getFiveLatestNotifications',
      (json) => (json as List).map((item) => NotificationResponse.fromJson(item)).toList(),
    );
    if (!response.success) throw response.error!;
    return response.result!;
  }

  Future<List<CampaignResponse>> fetchCampaigns(List<String> filters) async {
    final response = await apiClient.post('/campaigns/getFiveCampaigns', {
      'filters': filters,
    }, (json) => (json as List).map((item) => CampaignResponse.fromJson(item)).toList());
    if (!response.success) throw response.error!;
    return response.result!;
  }

  Future<void> markNotificationAsRead(String notificationId) async {
    final response = await apiClient.post('/notifications/markAsRead', {
      'notificationId': notificationId,
    }, (json) => null);

    if (!response.success) throw response.error!;
  }

  Future<CampaignSearchResponse> searchCampaigns(CampaignSearchRequest request) async {
    final response = await apiClient.post(
      '/campaigns/search',
      request.toJson(),
      (json) => CampaignSearchResponse.fromJson(json),
    );

    if (!response.success) throw response.error!;
    return response.result!;
  }
}
