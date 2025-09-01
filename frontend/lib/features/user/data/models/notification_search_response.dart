import 'package:frontend/features/home/data/models/notification_response.dart';

class NotificationSearchResponse {
  final List<NotificationResponse> notifications;
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final bool hasNext;
  final bool hasPrev;

  NotificationSearchResponse({
    required this.notifications,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.hasNext,
    required this.hasPrev,
  });

  factory NotificationSearchResponse.fromJson(Map<String, dynamic> json) {
    return NotificationSearchResponse(
      notifications: (json['notifications'] as List).map((item) => NotificationResponse.fromJson(item)).toList(),
      currentPage: json['currentPage'] as int,
      totalPages: json['totalPages'] as int,
      totalItems: json['totalItems'] as int,
      hasNext: json['hasNext'] as bool,
      hasPrev: json['hasPrev'] as bool,
    );
  }
}
