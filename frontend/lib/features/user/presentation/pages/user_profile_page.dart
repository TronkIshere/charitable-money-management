import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';
import 'package:frontend/features/user/presentation/widgets/user_profile_appBar.dart';
import 'package:frontend/features/user/presentation/widgets/user_profile_avt.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final String avatarUrl = 'https://i.pravatar.cc/300';
  final String fullName = 'Nguyễn Văn A';
  final String email = 'nguyenvana@example.com';
  final String phone = '0123 456 789';
  final String address = '123 Đường ABC, Quận 1, TP.HCM';
  final String gender = 'Nam';
  final String birthday = '01/01/2000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserProfileAppbar(title: 'Thông tin người dùng'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              UserProfileAvt(avatarUrl: avatarUrl, fullName: fullName, email: email),
              const SizedBox(height: 30),
              _buildInfoCard(context, 'Giới tính', gender, Icons.person),
              const SizedBox(height: 16),
              _buildInfoCard(context, 'Ngày sinh', birthday, Icons.cake),
              const SizedBox(height: 16),
              _buildInfoCard(context, 'Số điện thoại', phone, Icons.phone),
              const SizedBox(height: 16),
              _buildInfoCard(context, 'Địa chỉ', address, Icons.home),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit-profile');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DefaultColors.primaryGreen,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text('Chỉnh sửa thông tin', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String title, String value, IconData icon) {
    final theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: DefaultColors.primaryGreen),
        title: Text(
          title,
          style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
        ),
        subtitle: Text(value, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
      ),
    );
  }
}
