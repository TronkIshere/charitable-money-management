import 'package:frontend/features/home/data/models/campaign_response.dart';
import 'package:frontend/features/home/domain/repositories/home_repository.dart';

class FetchCampaignsUseCase {
  final HomeRepository homeRepository;
  FetchCampaignsUseCase({required this.homeRepository});

  Future<List<CampaignResponse>> call({required List<String> filters}) {
    return homeRepository.fetchCampaigns(filters);
  }
}
