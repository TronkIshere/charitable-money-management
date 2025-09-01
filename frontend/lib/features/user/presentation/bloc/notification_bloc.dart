import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/domain/usecase/fetch_notifications_use_case.dart';
import 'package:frontend/features/home/domain/usecase/mark_notification_as_read_use_case.dart';
import 'package:frontend/features/user/domain/usecase/search_notifications_use_case.dart';
import 'package:frontend/features/user/presentation/bloc/notification_event.dart';
import 'package:frontend/features/user/presentation/bloc/notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final FetchNotificationsUseCase fetchNotificationsUseCase;
  final MarkNotificationAsReadUseCase markNotificationAsReadUseCase;
  final SearchNotificationsUseCase searchNotificationsUseCase;

  NotificationBloc({
    required this.fetchNotificationsUseCase,
    required this.markNotificationAsReadUseCase,
    required this.searchNotificationsUseCase,
  }) : super(NotificationInitial()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<LoadMoreNotifications>(_onLoadMoreNotifications);
    on<MarkNotificationAsRead>(_onMarkAsRead);
  }

  Future<void> _onLoadNotifications(LoadNotifications event, Emitter<NotificationState> emit) async {
    emit(NotificationsSearchLoading());
    try {
      final response = await searchNotificationsUseCase(event.request);
      emit(
        NotificationsSearchLoaded(
          searchResponse: response,
          allNotifications: response.notifications,
          request: event.request,
        ),
      );
    } catch (e) {
      emit(NotificationsSearchError(e.toString()));
    }
  }

  Future<void> _onLoadMoreNotifications(LoadMoreNotifications event, Emitter<NotificationState> emit) async {
    final currentState = state;
    if (currentState is! NotificationsSearchLoaded || !currentState.searchResponse.hasNext) return;

    try {
      final nextPageRequest = event.request.copyWith(page: currentState.searchResponse.currentPage + 1);
      final response = await searchNotificationsUseCase(nextPageRequest);

      final allNotifications = [...currentState.allNotifications, ...response.notifications];

      emit(
        NotificationsSearchLoaded(
          searchResponse: response,
          allNotifications: allNotifications,
          request: nextPageRequest,
        ),
      );
    } catch (e) {
      emit(NotificationsSearchError(e.toString()));
    }
  }

  Future<void> _onMarkAsRead(MarkNotificationAsRead event, Emitter<NotificationState> emit) async {
    try {
      await markNotificationAsReadUseCase(event.notificationId);
      if (state is NotificationsSearchLoaded) {
        add(LoadNotifications(request: (state as NotificationsSearchLoaded).request));
      }
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}
