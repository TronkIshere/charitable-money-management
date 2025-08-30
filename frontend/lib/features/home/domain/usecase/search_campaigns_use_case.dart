import 'package:frontend/features/home/data/models/campaign_search_request.dart';
import 'package:frontend/features/home/data/models/campaign_search_response.dart';
import 'package:frontend/features/home/domain/repositories/home_repository.dart';

class SearchCampaignsUseCase {
  final HomeRepository homeRepository;
  SearchCampaignsUseCase({required this.homeRepository});

  Future<CampaignSearchResponse> call(CampaignSearchRequest request) {
    return homeRepository.searchCampaigns(request);
  }
}
