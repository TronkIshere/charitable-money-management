import 'dart:io';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final String phoneNumber;
  final String address;
  final DateTime? date;
  final String? gender;
  final File? avatar;

  RegisterEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.address,
    this.date,
    this.gender,
    this.avatar,
  });
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}
