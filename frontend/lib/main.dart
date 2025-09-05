import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/di/injection_container.dart';
import 'package:frontend/core/services/SocketService.dart';
import 'package:frontend/core/theme/theme.dart';
import 'package:frontend/features/admin/presentation/pages/manage_campaigns_page.dart';
import 'package:frontend/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:frontend/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:frontend/features/auth/presentation/pages/login_page.dart';
import 'package:frontend/features/auth/presentation/pages/register_page.dart';
import 'package:frontend/features/campaign/presentation/pages/campaign_page.dart';
import 'package:frontend/features/campaign/presentation/pages/campaigns_searching_page.dart';
import 'package:frontend/features/campaign/presentation/pages/register_campaign_page.dart';
import 'package:frontend/features/campaign/presentation/pages/report_campaign_page.dart';
import 'package:frontend/features/home/presentation/pages/home_page.dart';
import 'package:frontend/features/home/presentation/pages/searching_page.dart';
import 'package:frontend/features/ledger/presentation/pages/update_account_page.dart';
import 'package:frontend/features/payment/presentation/pages/payment_details_page.dart';
import 'package:frontend/features/payment/presentation/pages/payment_page.dart';
import 'package:frontend/features/user/presentation/pages/introduction_page.dart';
import 'package:frontend/features/user/presentation/pages/liked_campaign_page.dart';
import 'package:frontend/features/user/presentation/pages/notifications_list_page.dart';
import 'package:frontend/features/user/presentation/pages/user_profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  final socketService = SocketService();
  await socketService.initSocket();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<AuthBloc>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChatApp',
        theme: AppTheme.lightTheme,
        home: const ManageCampaignsPage(),
        routes: {
          '/login': (_) => const LoginPage(),
          '/register': (_) => const RegisterPage(),
          '/forgotPassword': (_) => const ForgotPasswordPage(),
          '/home': (_) => const HomePage(),
          '/searching': (_) => const SearchingPage(),
          '/notifications': (_) => const NotificationsListPage(),
          '/introduction': (_) => const IntroductionPage(),
          '/userProfile': (_) => const UserProfilePage(),
          '/campaignsList': (_) => const CampaignsSearchingPage(),
          '/campaign': (_) => const CampaignPage(),
          '/payment': (_) => const PaymentPage(),
          '/paymentDetails': (_) => const PaymentDetailsPage(),
          '/likedCampaignList': (_) => const LikedCampaignPage(),
          '/reportCampaign': (_) => ReportCampaignPage(),
          '/updateAccount': (_) => UpdateAccountPage(),
          "/registerCampaign": (_) => RegisterCampaignPage(),
          '/manageCampaign': (_) => ManageCampaignsPage(),
        },
      ),
    );
  }
}
