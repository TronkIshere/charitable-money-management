import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/campaign/domain/usecase/get_liked_campaigns_use_case.dart';
import 'package:frontend/features/user/domain/usecase/fetch_user_profile_use_case.dart';
import 'package:frontend/features/user/presentation/bloc/user_event.dart';
import 'package:frontend/features/user/presentation/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FetchUserProfileUseCase fetchUserProfileUseCase;
  final GetLikedCampaignsUseCase getLikedCampaignsUseCase;

  UserBloc({required this.fetchUserProfileUseCase, required this.getLikedCampaignsUseCase}) : super(UserInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
    on<LoadLikedCampaigns>(_onLoadLikedCampaigns);
  }

  Future<void> _onLoadUserProfile(LoadUserProfile event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final user = await fetchUserProfileUseCase();
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onLoadLikedCampaigns(LoadLikedCampaigns event, Emitter<UserState> emit) async {
    emit(UserLikedCampaignsLoading());
    try {
      final likedCampaigns = await getLikedCampaignsUseCase(event.request);
      emit(UserLikedCampaignsLoaded(likedCampaigns));
    } catch (e) {
      emit(UserError('Không thể tải danh sách chiến dịch đã thích'));
    }
  }
}
