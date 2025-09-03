import 'package:frontend/features/campaign/data/models/campaign_response.dart';
import 'package:frontend/features/campaign/domain/repositories/campaign_repository.dart';

class FetchCampaignsUseCase {
  final CampaignRepository campaignRepository;
  FetchCampaignsUseCase({required this.campaignRepository});

  Future<List<CampaignResponse>> call({required List<String> filters}) {
    return campaignRepository.fetchCampaigns(filters);
  }
}
