import 'package:frontend/features/campaign/data/models/register_campaign_request.dart';
import 'package:frontend/features/campaign/domain/repositories/campaign_repository.dart';

class SendRegisterCampaignUseCase {
  final CampaignRepository campaignRepository;
  SendRegisterCampaignUseCase({required this.campaignRepository});

  Future<void> call(RegisterCampaignRequest request) {
    return campaignRepository.sendRegisterCampaign(request);
  }
}
