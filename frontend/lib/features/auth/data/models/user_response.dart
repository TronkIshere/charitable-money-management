import 'package:frontend/features/auth/domain/entity/user_entity.dart';

class UserResponse extends UserEntity {
  UserResponse({
    required super.id,
    required super.username,
    required super.email,
    super.token = '',
    required super.phoneNumber,
    required super.address,
    required super.date,
    required super.gender,
    required super.avatarUrl,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      token: json['token'] ?? '',
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      date: DateTime.parse(json['date']),
      gender: json['gender'] as String,
      avatarUrl: json['avatarUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'token': token,
      'phoneNumber': phoneNumber,
      'address': address,
      'date': date.toIso8601String(),
      'gender': gender,
      'avatarUrl': avatarUrl,
    };
  }
}
