import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:frontend/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:frontend/features/auth/domain/repositories/auth_repository.dart';
import 'package:frontend/features/auth/domain/usecase/check_otp_use_case.dart';
import 'package:frontend/features/auth/domain/usecase/get_otp_use_case.dart';
import 'package:frontend/features/auth/domain/usecase/login_use_case.dart';
import 'package:frontend/features/auth/domain/usecase/register_use_case.dart';
import 'package:frontend/features/auth/domain/usecase/send_new_password_use_case.dart';
import 'package:frontend/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:frontend/features/home/data/datasource/home_remote_data_source.dart';
import 'package:frontend/features/home/data/repositories/home_repository_impl.dart';
import 'package:frontend/features/home/domain/repositories/home_repository.dart';
import 'package:frontend/features/home/domain/usecase/fetch_campaigns_use_case.dart';
import 'package:frontend/features/home/domain/usecase/search_campaigns_use_case.dart';
import 'package:frontend/features/home/presentation/bloc/home_bloc.dart';
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

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(homeRemoteDataSource: sl()));
  sl.registerLazySingleton<NotificationRepository>(() => NotificationRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userDataSource: sl()));

  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => GetOtpUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => CheckOtpUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SendNewPasswordUseCase(authRepository: sl()));

  sl.registerLazySingleton(() => FetchCampaignsUseCase(homeRepository: sl()));
  sl.registerLazySingleton(() => SearchCampaignsUseCase(homeRepository: sl()));

  sl.registerLazySingleton(() => FetchNotificationsUseCase(notificationRepository: sl()));
  sl.registerLazySingleton(() => MarkNotificationAsReadUseCase(notificationRepository: sl()));
  sl.registerLazySingleton(() => SearchNotificationsUseCase(notificationRepository: sl()));

  sl.registerLazySingleton(() => FetchUserProfileUseCase(userRepository: sl()));

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

  sl.registerFactory(() => UserBloc(fetchUserProfileUseCase: sl()));
}
