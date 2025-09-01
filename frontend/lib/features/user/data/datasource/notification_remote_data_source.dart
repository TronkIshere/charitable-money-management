import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/user/data/models/notification_response.dart';
import 'package:frontend/features/user/data/models/notification_search_request.dart';
import 'package:frontend/features/user/data/models/notification_search_response.dart';

class NotificationRemoteDataSource {
  final ApiClient apiClient;

  NotificationRemoteDataSource({required this.apiClient});

  Future<List<NotificationResponse>> fetchNotifications() async {
    final response = await apiClient.get(
      '/notifications/getFiveLatestNotifications',
      (json) => (json as List).map((item) => NotificationResponse.fromJson(item)).toList(),
    );

    if (!response.success) throw response.error!;
    return response.result!;
  }

  Future<void> markAsRead(String notificationId) async {
    final response = await apiClient.post('/notifications/markAsRead', {
      'notificationId': notificationId,
    }, (json) => null);

    if (!response.success) throw response.error!;
  }

  Future<NotificationSearchResponse> searchNotifications(NotificationSearchRequest request) async {
    final response = await apiClient.post(
      '/notifications/search',
      request.toJson(),
      (json) => NotificationSearchResponse.fromJson(json),
    );

    if (!response.success) throw response.error!;
    return response.result!;
  }
}
