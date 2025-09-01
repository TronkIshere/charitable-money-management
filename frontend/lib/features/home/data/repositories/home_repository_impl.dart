import 'package:frontend/features/home/data/datasource/home_remote_data_source.dart';
import 'package:frontend/features/home/data/models/campaign_response.dart';
import 'package:frontend/features/home/data/models/campaign_search_request.dart';
import 'package:frontend/features/home/data/models/campaign_search_response.dart';
import 'package:frontend/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<List<CampaignResponse>> fetchCampaigns(List<String> filters) {
    return homeRemoteDataSource.fetchCampaigns(filters);
  }

  @override
  Future<CampaignSearchResponse> searchCampaigns(CampaignSearchRequest request) {
    return homeRemoteDataSource.searchCampaigns(request);
  }
}
