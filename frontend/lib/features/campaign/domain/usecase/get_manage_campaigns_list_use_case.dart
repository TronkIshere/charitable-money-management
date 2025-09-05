import 'package:frontend/features/campaign/data/models/campaign_search_request.dart';
import 'package:frontend/features/campaign/data/models/campaign_search_response.dart';
import 'package:frontend/features/campaign/domain/repositories/campaign_repository.dart';

class GetManageCampaignsListUseCase {
  final CampaignRepository campaignRepository;
  GetManageCampaignsListUseCase({required this.campaignRepository});

  Future<CampaignSearchResponse> call(CampaignSearchRequest request) {
    return campaignRepository.getManageCampaignsList(request);
  }
}
