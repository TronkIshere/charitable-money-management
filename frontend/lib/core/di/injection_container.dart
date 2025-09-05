import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/admin/presentation/bloc/admin_bloc.dart';
import 'package:frontend/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:frontend/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:frontend/features/auth/domain/repositories/auth_repository.dart';
import 'package:frontend/features/auth/domain/usecase/check_otp_use_case.dart';
import 'package:frontend/features/auth/domain/usecase/get_otp_use_case.dart';
import 'package:frontend/features/auth/domain/usecase/login_use_case.dart';
import 'package:frontend/features/auth/domain/usecase/register_use_case.dart';
import 'package:frontend/features/auth/domain/usecase/send_new_password_use_case.dart';
import 'package:frontend/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:frontend/features/campaign/data/datasource/campaign_remote_datasource.dart';
import 'package:frontend/features/campaign/data/repositories/campaign_repository_impl.dart';
import 'package:frontend/features/campaign/domain/repositories/campaign_repository.dart';
import 'package:frontend/features/campaign/domain/usecase/fetch_campaigns_use_case.dart';
import 'package:frontend/features/campaign/domain/usecase/get_liked_campaigns_use_case.dart';
import 'package:frontend/features/campaign/domain/usecase/get_manage_campaigns_list_use_case.dart';
import 'package:frontend/features/campaign/domain/usecase/search_campaigns_use_case.dart';
import 'package:frontend/features/campaign/domain/usecase/send_register_campaign_use_case.dart';
import 'package:frontend/features/campaign/domain/usecase/send_report_campaign_use_case.dart';
import 'package:frontend/features/campaign/presentation/bloc/campaigns_bloc.dart';
import 'package:frontend/features/home/data/datasource/home_remote_data_source.dart';
import 'package:frontend/features/home/data/repositories/home_repository_impl.dart';
import 'package:frontend/features/home/domain/repositories/home_repository.dart';
import 'package:frontend/features/home/presentation/bloc/home_bloc.dart';
import 'package:frontend/features/ledger/data/datasource/ledger_remote_datasource.dart';
import 'package:frontend/features/ledger/data/repositories/ledger_repository_impl.dart';
import 'package:frontend/features/ledger/domain/repositories/ledger_repository.dart';
import 'package:frontend/features/ledger/domain/usecase/send_update_account_use_case.dart';
import 'package:frontend/features/ledger/presentation/bloc/ledger_bloc.dart';
import 'package:frontend/features/payment/data/datasource/payment_remote_data_source.dart';
import 'package:frontend/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:frontend/features/payment/domain/repositories/payment_repository.dart';
import 'package:frontend/features/payment/domain/usecase/get_transaction_detail_usecase.dart';
import 'package:frontend/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:frontend/features/user/data/datasource/notification_remote_data_source.dart';
import 'package:frontend/features/user/data/datasource/user_remote_data_source.dart';
import 'package:frontend/features/user/data/repositories/notification_repository.dart';
import 'package:frontend/features/user/data/repositories/user_repository.dart';
import 'package:frontend/features/user/domain/repositories/notification_repository_impl.dart';
import 'package:frontend/features/user/domain/repositories/user_repository_impl.dart';
import 'package:frontend/features/user/domain/usecase/fetch_notifications_use_case.dart';
import 'package:frontend/features/user/domain/usecase/fetch_user_profile_use_case.dart';
import 'package:frontend/features/user/domain/usecase/mark_notification_as_read_use_case.dart';
import 'package:frontend/features/user/domain/usecase/search_notifications_use_case.dart';
import 'package:frontend/features/user/presentation/bloc/notification_bloc.dart';
import 'package:frontend/features/user/presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance; // service locator

Future<void> initDependencies() async {
  // Core
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => ApiClient(baseUrl: "http://10.0.2.2:6000/api/v1"));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource(apiClient: sl()));
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSource(apiClient: sl()));
  sl.registerLazySingleton<NotificationRemoteDataSource>(() => NotificationRemoteDataSource(apiClient: sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(apiClient: sl()));
  sl.registerLazySingleton<CampaignRemoteDataSource>(() => CampaignRemoteDataSource(apiClient: sl()));
  sl.registerLazySingleton<PaymentRemoteDataSource>(() => PaymentRemoteDataSource(apiClient: sl()));
  sl.registerLazySingleton<LedgerRemoteDataSource>(() => LedgerRemoteDataSource(apiClient: sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(homeRemoteDataSource: sl()));
  sl.registerLazySingleton<NotificationRepository>(() => NotificationRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userDataSource: sl()));
  sl.registerLazySingleton<CampaignRepository>(() => CampaignRepositoryImpl(campaignRemoteDataSource: sl()));
  sl.registerLazySingleton<PaymentRepository>(() => PaymentRepositoryImpl(paymentRemoteDataSource: sl()));
  sl.registerLazySingleton<LedgerRepository>(() => LedgerRepositoryImpl(ledgerRemoteDataSource: sl()));

  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => GetOtpUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => CheckOtpUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SendNewPasswordUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => FetchCampaignsUseCase(campaignRepository: sl()));
  sl.registerLazySingleton(() => SearchCampaignsUseCase(campaignRepository: sl()));
  sl.registerLazySingleton(() => FetchNotificationsUseCase(notificationRepository: sl()));
  sl.registerLazySingleton(() => MarkNotificationAsReadUseCase(notificationRepository: sl()));
  sl.registerLazySingleton(() => SearchNotificationsUseCase(notificationRepository: sl()));
  sl.registerLazySingleton(() => FetchUserProfileUseCase(userRepository: sl()));
  sl.registerLazySingleton(() => GetTransactionDetailUseCase(paymentRepository: sl()));
  sl.registerLazySingleton(() => GetLikedCampaignsUseCase(campaignRepository: sl()));
  sl.registerLazySingleton(() => SendReportCampaignUseCase(campaignRepository: sl()));
  sl.registerLazySingleton(() => SendUpdateAccountUseCase(ledgerRepository: sl()));
  sl.registerLazySingleton(() => SendRegisterCampaignUseCase(campaignRepository: sl()));
  sl.registerLazySingleton(() => GetManageCampaignsListUseCase(campaignRepository: sl()));

  // Blocs
  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl(),
      registerUseCase: sl(),
      getOtpUseCase: sl(),
      checkOtpUseCase: sl(),
      sendNewPasswordUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => HomeBloc(
      fetchNotificationsUseCase: sl(),
      fetchCampaignsUseCase: sl(),
      markNotificationAsReadUseCase: sl(),
      searchCampaignsUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => NotificationBloc(
      fetchNotificationsUseCase: sl(),
      markNotificationAsReadUseCase: sl(),
      searchNotificationsUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => CampaignBloc(
      searchCampaignsUseCase: sl(),
      getCampaignByIdUseCase: sl(),
      sendReportCampaignUseCase: sl(),
      sendRegisterCampaignUseCase: sl(),
    ),
  );

  sl.registerFactory(() => UserBloc(fetchUserProfileUseCase: sl(), getLikedCampaignsUseCase: sl()));

  sl.registerFactory(() => PaymentBloc(getTransactionDetailUseCase: sl()));

  sl.registerFactory(() => LedgerBloc(sendUpdateAccountUseCase: sl()));

  sl.registerFactory(() => AdminBloc(getManageCampaignsListUseCase: sl()));
}
