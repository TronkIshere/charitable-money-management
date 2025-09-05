import 'package:frontend/features/campaign/data/models/campaign_search_request.dart';

abstract class UserEvent {}

class LoadUserProfile extends UserEvent {}

class LoadLikedCampaigns extends UserEvent {
  final CampaignSearchRequest request;
  LoadLikedCampaigns({required this.request});
}
