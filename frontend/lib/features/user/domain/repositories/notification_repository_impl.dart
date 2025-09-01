import 'package:frontend/features/home/data/models/notification_response.dart';
import 'package:frontend/features/user/data/datasource/notification_remote_data_source.dart';
import 'package:frontend/features/user/data/models/notification_search_request.dart';
import 'package:frontend/features/user/data/models/notification_search_response.dart';
import 'package:frontend/features/user/data/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<NotificationResponse>> fetchNotifications() {
    return remoteDataSource.fetchNotifications();
  }

  @override
  Future<void> markAsRead(String notificationId) {
    return remoteDataSource.markAsRead(notificationId);
  }

  @override
  Future<NotificationSearchResponse> searchNotifications(NotificationSearchRequest request) {
    return remoteDataSource.searchNotifications(request);
  }
}
