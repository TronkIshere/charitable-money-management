class CampaignEntity {
  final String title;
  final String organizeName;
  final int dateLeft;
  final BigInt goal;
  final BigInt achieved;

  CampaignEntity({
    required this.title,
    required this.organizeName,
    required this.dateLeft,
    required this.goal,
    required this.achieved,
  });
}
