class CampaignResponse {
  final String id;
  final String title;
  final String organizeName;
  final int dateLeft;
  final BigInt goal;
  final BigInt achieved;

  CampaignResponse({
    required this.id,
    required this.title,
    required this.organizeName,
    required this.dateLeft,
    required this.goal,
    required this.achieved,
  });

  factory CampaignResponse.fromJson(Map<String, dynamic> json) {
    return CampaignResponse(
      id: json['id'] as String,
      title: json['title'] as String,
      organizeName: json['organizeName'] as String,
      dateLeft: json['dateLeft'] as int,
      goal: BigInt.parse(json['goal'].toString()),
      achieved: BigInt.parse(json['achieved'].toString()),
    );
  }
}
