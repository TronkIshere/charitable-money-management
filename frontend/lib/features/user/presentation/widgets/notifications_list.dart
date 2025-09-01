import 'package:flutter/material.dart';
import 'package:frontend/features/user/presentation/widgets/notifications_list_item.dart';

class NotificationsList extends StatelessWidget {
  final List<Map<String, dynamic>> notifications;

  const NotificationsList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationsListItem(notification: notifications[index]);
        },
      ),
    );
  }
}
