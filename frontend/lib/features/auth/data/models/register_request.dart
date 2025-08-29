import 'dart:io';

class RegisterRequest {
  final String username;
  final String email;
  final String password;
  final String phoneNumber;
  final String address;
  final DateTime date;
  final String gender;
  final File avatar;

  RegisterRequest({
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.address,
    required this.date,
    required this.gender,
    required this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'address': address,
      'date': date.toIso8601String(),
      'gender': gender,
      'avatar': avatar,
    };
  }
}
