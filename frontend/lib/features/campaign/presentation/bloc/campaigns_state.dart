import 'package:frontend/features/campaign/data/models/campaign_response.dart';
import 'package:frontend/features/campaign/data/models/campaign_search_response.dart';

abstract class CampaignState {}

class CampaignInitial extends CampaignState {}

class CampaignLoading extends CampaignState {}

class CampaignLoaded extends CampaignState {
  final CampaignSearchResponse searchResponse;
  CampaignLoaded({required this.searchResponse});
}

class CampaignError extends CampaignState {
  final String message;
  CampaignError(this.message);
}

class CampaignDetailLoaded extends CampaignState {
  final CampaignResponse campaign;
  CampaignDetailLoaded({required this.campaign});
}

class ReportCampaignInitial extends CampaignState {}

class ReportCampaignLoading extends CampaignState {}

class ReportCampaignSuccess extends CampaignState {}

class ReportCampaignFailure extends CampaignState {
  final String message;
  ReportCampaignFailure(this.message);
}
