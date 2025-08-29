class UserEntity {
  final String id;
  final String email;
  final String username;
  final String token;
  final String phoneNumber;
  final String address;
  final DateTime date;
  final String gender;
  final String avatarUrl;

  UserEntity({
    required this.id,
    required this.email,
    required this.username,
    this.token = '',
    required this.phoneNumber,
    required this.address,
    required this.date,
    required this.gender,
    required this.avatarUrl,
  });
}
