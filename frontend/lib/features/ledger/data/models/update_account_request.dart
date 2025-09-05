class UpdateAccountRequest {
  final String id;
  final String name;
  final String phoneNumber;
  final String email;
  final String organizeName;
  final String organizeAddress;
  final String reason;
  final List<String> attachments;

  UpdateAccountRequest({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.organizeName,
    required this.organizeAddress,
    required this.reason,
    required this.attachments,
  });

  Map<String, String> toFields() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'organizeName': organizeName,
      'organizeAddress': organizeAddress,
      'reason': reason,
    };
  }
}
