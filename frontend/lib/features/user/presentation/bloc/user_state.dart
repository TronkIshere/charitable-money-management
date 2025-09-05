import 'package:frontend/features/campaign/data/models/campaign_search_response.dart';
import 'package:frontend/features/user/data/models/user_response.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserResponse user;
  UserLoaded(this.user);
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}

class UserLikedCampaignsLoading extends UserState {}

class UserLikedCampaignsLoaded extends UserState {
  final CampaignSearchResponse likedCampaigns;
  UserLikedCampaignsLoaded(this.likedCampaigns);
}
