class ReportCampaignRequest {
  final String campaignId;
  final String reason;
  final String description;
  final String contact;
  final List<String> attachments;

  ReportCampaignRequest({
    required this.campaignId,
    required this.reason,
    required this.description,
    required this.contact,
    required this.attachments,
  });

  Map<String, dynamic> toJson() {
    return {
      'campaignId': campaignId,
      'reason': reason,
      'description': description,
      'contact': contact,
      'attachments': attachments,
    };
  }
}
