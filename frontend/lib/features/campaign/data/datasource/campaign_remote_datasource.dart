import 'dart:io';

import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/campaign/data/models/campaign_response.dart';
import 'package:frontend/features/campaign/data/models/campaign_search_request.dart';
import 'package:frontend/features/campaign/data/models/campaign_search_response.dart';
import 'package:frontend/features/campaign/data/models/report_campaign_request.dart';

class CampaignRemoteDataSource {
  ApiClient apiClient;
  CampaignRemoteDataSource({required this.apiClient});

  Future<List<CampaignResponse>> fetchCampaigns(List<String> filters) async {
    final response = await apiClient.post('/campaigns/getFiveCampaigns', {
      'filters': filters,
    }, (json) => (json as List).map((item) => CampaignResponse.fromJson(item)).toList());
    if (!response.success) throw response.error!;
    return response.result!;
  }

  Future<CampaignSearchResponse> searchCampaigns(CampaignSearchRequest request) async {
    final response = await apiClient.post(
      '/campaigns/search',
      request.toJson(),
      (json) => CampaignSearchResponse.fromJson(json),
    );
    if (!response.success) throw response.error!;
    return response.result!;
  }

  Future<CampaignResponse> getCampaignById(String id) async {
    final response = await apiClient.get('/campaigns/$id', (json) => CampaignResponse.fromJson(json));
    if (!response.success) throw response.error!;
    return response.result!;
  }

  Future<CampaignSearchResponse> getLikedCampaigns(CampaignSearchRequest request) async {
    final response = await apiClient.get('/campaigns/liked', (json) => CampaignSearchResponse.fromJson(json));
    if (!response.success) throw response.error!;
    return response.result!;
  }

  Future<void> sendReport(ReportCampaignRequest request) async {
    final response = await apiClient.multipartPost(
      '/campaigns/${request.campaignId}/report',
      fields: {'reason': request.reason, 'description': request.description, 'contact': request.contact},
      files: request.attachments.map((path) => File(path)).toList(),
    );

    if (!response.success) throw response.error!;
  }
}
