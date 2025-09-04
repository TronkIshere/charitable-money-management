import 'package:frontend/features/campaign/data/models/campaign_response.dart';
import 'package:frontend/features/campaign/domain/repositories/campaign_repository.dart';

class GetCampaignByIdUseCase {
  final CampaignRepository campaignRepository;
  GetCampaignByIdUseCase({required this.campaignRepository});

  Future<CampaignResponse> call(String id) {
    return campaignRepository.getCampaignById(id);
  }
}
