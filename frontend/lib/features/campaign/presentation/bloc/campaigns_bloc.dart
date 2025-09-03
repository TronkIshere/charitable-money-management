import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/campaign/domain/usecase/search_campaigns_use_case.dart';
import 'package:frontend/features/campaign/presentation/bloc/campaigns_event.dart';
import 'package:frontend/features/campaign/presentation/bloc/campaigns_state.dart';

class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  final SearchCampaignsUseCase searchCampaignsUseCase;
  CampaignBloc({required this.searchCampaignsUseCase}) : super(CampaignInitial()) {
    on<SearchCampaigns>(_onSearchCampaigns);
  }

  Future<void> _onSearchCampaigns(SearchCampaigns event, Emitter<CampaignState> emit) async {
    emit(CampaignLoading());
    try {
      final response = await searchCampaignsUseCase(event.request);

      emit(CampaignLoaded(searchResponse: response));
    } catch (error) {
      emit(CampaignError('Failed to search campaigns'));
    }
  }
}
