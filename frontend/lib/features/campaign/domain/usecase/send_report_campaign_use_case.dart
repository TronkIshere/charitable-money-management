import 'package:frontend/features/campaign/data/models/report_campaign_request.dart';
import 'package:frontend/features/campaign/domain/repositories/campaign_repository.dart';

class SendReportCampaignUseCase {
  final CampaignRepository campaignRepository;
  SendReportCampaignUseCase({required this.campaignRepository});

  Future<void> call(ReportCampaignRequest request) {
    return campaignRepository.sendReport(request);
  }
}
