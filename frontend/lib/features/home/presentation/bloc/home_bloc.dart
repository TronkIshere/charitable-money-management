import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/services/SocketService.dart';
import 'package:frontend/features/home/domain/usecase/fetch_campaigns_use_case.dart';
import 'package:frontend/features/home/domain/usecase/fetch_notifications_use_case.dart';
import 'package:frontend/features/home/domain/usecase/mark_notification_as_read_use_case.dart';
import 'package:frontend/features/home/presentation/bloc/home_event.dart';
import 'package:frontend/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchCampaignsUseCase fetchCampaignsUseCase;
  final FetchNotificationsUseCase fetchNotificationsUseCase;
  final MarkNotificationAsReadUseCase markNotificationAsReadUseCase;
  final SocketService _socketService = SocketService();

  HomeBloc({
    required this.fetchNotificationsUseCase,
    required this.fetchCampaignsUseCase,
    required this.markNotificationAsReadUseCase,
  }) : super(HomeInitial()) {
    on<FetchNotifications>(_onFetchNotifications);
    on<FetchCampaigns>(_onFetchCampaigns);
    on<MarkNotificationAsRead>(_onMarkNotificationAsRead);
    _initializeSocketListeners();
  }

  void _initializeSocketListeners() {
    try {
      _socketService.socket.on('notificationUpdated', _onNotificationsUploaded);
    } catch (e) {
      print("Error initializing socket listeners: $e");
    }
  }

  Future<void> _onFetchNotifications(FetchNotifications event, Emitter<HomeState> emit) async {
    emit(NotificationsLoading());
    try {
      final notifications = await fetchNotificationsUseCase();
      emit(NotificationsLoaded(notifications));
    } catch (error) {
      emit(NotificationsError('Failed to lead notifications'));
    }
  }

  void _onNotificationsUploaded(data) {
    add(FetchNotifications());
  }

  Future<void> _onFetchCampaigns(FetchCampaigns event, Emitter<HomeState> emit) async {
    emit(CampaignsLoading());
    try {
      final campaigns = await fetchCampaignsUseCase(filters: event.filters);
      emit(CampaignsLoaded(campaigns));
    } catch (error) {
      emit(CampaignsError('Failed to lead campagins'));
    }
  }

  Future<void> _onMarkNotificationAsRead(MarkNotificationAsRead event, Emitter<HomeState> emit) async {
    try {
      await markNotificationAsReadUseCase(event.notificationId);
      add(FetchNotifications());
    } catch (error) {
      emit(NotificationsError('Failed to mark notification as read'));
    }
  }
}
