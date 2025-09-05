class RegisterCampaignRequest {
  final String title;
  final String goal;
  final String startDate;
  final String category;
  final String description;
  final String shortSummary;
  final String organizationName;
  final String email;
  final String phone;
  final List<String> attachments;
  final List<String> verificationDocs;

  RegisterCampaignRequest({
    required this.title,
    required this.goal,
    required this.startDate,
    required this.category,
    required this.description,
    required this.shortSummary,
    required this.organizationName,
    required this.email,
    required this.phone,
    required this.attachments,
    required this.verificationDocs,
  });

  Map<String, String> toFields() {
    return {
      'title': title,
      'goal': goal,
      'startDate': startDate,
      'category': category,
      'description': description,
      'shortSummary': shortSummary,
      'organizationName': organizationName,
      'email': email,
      'phone': phone,
    };
  }
}
