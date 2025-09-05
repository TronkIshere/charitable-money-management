import 'package:frontend/features/campaign/data/models/campaign_response.dart';
import 'package:frontend/features/campaign/data/models/campaign_search_request.dart';
import 'package:frontend/features/campaign/data/models/campaign_search_response.dart';

abstract class CampaignRepository {
  Future<List<CampaignResponse>> fetchCampaigns(List<String> filters);
  Future<CampaignSearchResponse> searchCampaigns(CampaignSearchRequest request);
  Future<CampaignResponse> getCampaignById(String id);
  Future<CampaignSearchResponse> getLikedCampaigns(CampaignSearchRequest request);
}
