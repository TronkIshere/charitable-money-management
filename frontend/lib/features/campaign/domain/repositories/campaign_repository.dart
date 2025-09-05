import 'package:frontend/features/campaign/data/models/campaign_response.dart';
import 'package:frontend/features/campaign/data/models/campaign_search_request.dart';
import 'package:frontend/features/campaign/data/models/campaign_search_response.dart';
import 'package:frontend/features/campaign/data/models/register_campaign_request.dart';
import 'package:frontend/features/campaign/data/models/report_campaign_request.dart';

abstract class CampaignRepository {
  Future<List<CampaignResponse>> fetchCampaigns(List<String> filters);
  Future<CampaignSearchResponse> searchCampaigns(CampaignSearchRequest request);
  Future<CampaignResponse> getCampaignById(String id);
  Future<CampaignSearchResponse> getLikedCampaigns(CampaignSearchRequest request);
  Future<void> sendReport(ReportCampaignRequest request);
  Future<void> sendRegisterCampaign(RegisterCampaignRequest request);
  Future<CampaignSearchResponse> getManageCampaignsList(CampaignSearchRequest request);
}
