class UserResponse {
  final String id;
  final String fullName;
  final String email;
  final String avatarUrl;

  UserResponse({required this.id, required this.fullName, required this.email, required this.avatarUrl});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
    );
  }
}
