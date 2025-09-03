import 'package:frontend/features/campaign/data/models/campaign_response.dart';

class CampaignSearchResponse {
  final List<CampaignResponse> campaigns;
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final bool hasNext;
  final bool hasPrev;

  CampaignSearchResponse({
    required this.campaigns,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.hasNext,
    required this.hasPrev,
  });

  factory CampaignSearchResponse.fromJson(Map<String, dynamic> json) {
    return CampaignSearchResponse(
      campaigns: (json['campaigns'] as List).map((item) => CampaignResponse.fromJson(item)).toList(),
      currentPage: json['currentPage'] as int,
      totalPages: json['totalPages'] as int,
      totalItems: json['totalItems'] as int,
      hasNext: json['hasNext'] as bool,
      hasPrev: json['hasPrev'] as bool,
    );
  }
}
