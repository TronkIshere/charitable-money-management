import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/user/domain/usecase/fetch_user_profile_use_case.dart';
import 'package:frontend/features/user/presentation/bloc/user_event.dart';
import 'package:frontend/features/user/presentation/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FetchUserProfileUseCase fetchUserProfileUseCase;

  UserBloc({required this.fetchUserProfileUseCase}) : super(UserInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
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
}
