import 'package:frontend/features/campaign/data/datasource/campaign_remote_datasource.dart';
import 'package:frontend/features/campaign/data/models/campaign_response.dart';
import 'package:frontend/features/campaign/data/models/campaign_search_request.dart';
import 'package:frontend/features/campaign/data/models/campaign_search_response.dart';
import 'package:frontend/features/campaign/data/models/register_campaign_request.dart';
import 'package:frontend/features/campaign/data/models/report_campaign_request.dart';
import 'package:frontend/features/campaign/domain/repositories/campaign_repository.dart';

class CampaignRepositoryImpl extends CampaignRepository {
  final CampaignRemoteDataSource campaignRemoteDataSource;
  CampaignRepositoryImpl({required this.campaignRemoteDataSource});

  @override
  Future<List<CampaignResponse>> fetchCampaigns(List<String> filters) {
    return campaignRemoteDataSource.fetchCampaigns(filters);
  }

  @override
  Future<CampaignSearchResponse> searchCampaigns(CampaignSearchRequest request) {
    return campaignRemoteDataSource.searchCampaigns(request);
  }

  @override
  Future<CampaignResponse> getCampaignById(String id) {
    return campaignRemoteDataSource.getCampaignById(id);
  }

  @override
  Future<CampaignSearchResponse> getLikedCampaigns(CampaignSearchRequest request) {
    return campaignRemoteDataSource.getLikedCampaigns(request);
  }

  @override
  Future<void> sendReport(ReportCampaignRequest request) {
    return campaignRemoteDataSource.sendReport(request);
  }

  @override
  Future<void> sendRegisterCampaign(RegisterCampaignRequest request) {
    return campaignRemoteDataSource.sendRegisterCampaign(request);
  }
}
