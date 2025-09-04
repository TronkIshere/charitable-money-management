import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/campaign/domain/usecase/get_campaign_by_id_use_case.dart';
import 'package:frontend/features/campaign/domain/usecase/search_campaigns_use_case.dart';
import 'package:frontend/features/campaign/presentation/bloc/campaigns_event.dart';
import 'package:frontend/features/campaign/presentation/bloc/campaigns_state.dart';

class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  final SearchCampaignsUseCase searchCampaignsUseCase;
  final GetCampaignByIdUseCase getCampaignByIdUseCase;
  CampaignBloc({required this.searchCampaignsUseCase, required this.getCampaignByIdUseCase})
    : super(CampaignInitial()) {
    on<SearchCampaigns>(_onSearchCampaigns);
    on<GetCampaignById>(_onGetCampaignById);
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

  Future<void> _onGetCampaignById(GetCampaignById event, Emitter<CampaignState> emit) async {
    emit(CampaignLoading());
    try {
      final response = await getCampaignByIdUseCase(event.id);
      emit(CampaignDetailLoaded(campaign: response));
    } catch (error) {
      emit(CampaignError('Failed to search campaigns'));
    }
  }
}
