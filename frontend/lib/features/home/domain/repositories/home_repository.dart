import 'package:frontend/features/home/data/models/campaign_response.dart';
import 'package:frontend/features/home/data/models/campaign_search_request.dart';
import 'package:frontend/features/home/data/models/campaign_search_response.dart';

abstract class HomeRepository {
  Future<List<CampaignResponse>> fetchCampaigns(List<String> filters);
  Future<CampaignSearchResponse> searchCampaigns(CampaignSearchRequest request);
}
