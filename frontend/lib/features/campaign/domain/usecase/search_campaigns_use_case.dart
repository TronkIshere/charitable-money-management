import 'package:frontend/features/campaign/data/models/campaign_search_request.dart';
import 'package:frontend/features/campaign/data/models/campaign_search_response.dart';
import 'package:frontend/features/campaign/domain/repositories/campaign_repository.dart';

class SearchCampaignsUseCase {
  final CampaignRepository campaignRepository;
  SearchCampaignsUseCase({required this.campaignRepository});

  Future<CampaignSearchResponse> call(CampaignSearchRequest request) {
    return campaignRepository.searchCampaigns(request);
  }
}
