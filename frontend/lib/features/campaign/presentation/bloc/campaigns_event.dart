import 'package:frontend/features/campaign/data/models/campaign_search_request.dart';
import 'package:frontend/features/campaign/data/models/register_campaign_request.dart';
import 'package:frontend/features/campaign/data/models/report_campaign_request.dart';

abstract class CampaignEvent {}

class SearchCampaigns extends CampaignEvent {
  final CampaignSearchRequest request;

  SearchCampaigns({required this.request});
}

class FetchSearchCampaigns extends CampaignEvent {
  final CampaignSearchRequest request;

  FetchSearchCampaigns({required this.request});
}

class LoadMoreCampaigns extends CampaignEvent {
  final CampaignSearchRequest request;

  LoadMoreCampaigns({required this.request});
}

class GetCampaignById extends CampaignEvent {
  final String id;
  GetCampaignById({required this.id});
}

class SendReportCampaign extends CampaignEvent {
  final ReportCampaignRequest request;
  SendReportCampaign(this.request);
}

class SendRegisterCampaign extends CampaignEvent {
  final RegisterCampaignRequest request;
  SendRegisterCampaign(this.request);
}
