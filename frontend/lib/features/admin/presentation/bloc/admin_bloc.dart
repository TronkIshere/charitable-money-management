import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/admin/presentation/bloc/admin_event.dart';
import 'package:frontend/features/admin/presentation/bloc/admin_state.dart';
import 'package:frontend/features/campaign/domain/usecase/get_manage_campaigns_list_use_case.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final GetManageCampaignsListUseCase getManageCampaignsListUseCase;
  AdminBloc({required this.getManageCampaignsListUseCase}) : super(CampaignInitial()) {
    on<SearchCampaigns>(_onGetManageCampaignsList);
  }

  Future<void> _onGetManageCampaignsList(SearchCampaigns event, Emitter<AdminState> emit) async {
    emit(CampaignLoading());
    try {
      final response = await getManageCampaignsListUseCase(event.request);
      emit(CampaignLoaded(searchResponse: response));
    } catch (error) {
      emit(CampaignError('Failed to search campaigns'));
    }
  }
}
