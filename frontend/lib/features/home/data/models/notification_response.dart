class NotificationResponse {
  final String id;
  final String organizeName;
  final String campaignTitle;
  final String context;
  final String avt;
  final DateTime date;

  NotificationResponse({
    required this.id,
    required this.organizeName,
    required this.campaignTitle,
    required this.context,
    required this.avt,
    required this.date,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      id: json['id'] as String,
      organizeName: json['organizeName'] as String,
      campaignTitle: json['campaignTitle'] as String,
      context: json['context'] as String,
      avt: json['avt'] as String,
      date: DateTime.parse(json['date']),
    );
  }
}
