import 'package:frontend/features/campaign/data/models/campaign_search_response.dart';

abstract class AdminState {}

class CampaignInitial extends AdminState {}

class CampaignLoading extends AdminState {}

class CampaignLoaded extends AdminState {
  final CampaignSearchResponse searchResponse;
  CampaignLoaded({required this.searchResponse});
}

class CampaignError extends AdminState {
  final String message;
  CampaignError(this.message);
}
