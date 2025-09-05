import 'package:frontend/features/campaign/data/models/campaign_search_request.dart';

abstract class AdminEvent {}

class SearchCampaigns extends AdminEvent {
  final CampaignSearchRequest request;
  SearchCampaigns({required this.request});
}
