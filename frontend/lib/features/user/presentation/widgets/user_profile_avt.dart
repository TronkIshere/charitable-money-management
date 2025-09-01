import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class UserProfileAvt extends StatelessWidget {
  final String avatarUrl;
  final String fullName;
  final String email;
  const UserProfileAvt({super.key, required this.avatarUrl, required this.fullName, required this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(radius: 60, backgroundImage: NetworkImage(avatarUrl)),
          const SizedBox(height: 16),
          Text(
            fullName,
            style: TextStyle(fontSize: FontsSizes.medium, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            email,
            style: TextStyle(fontSize: FontsSizes.medium, color: DefaultColors.greyText),
          ),
        ],
      ),
    );
  }
}
