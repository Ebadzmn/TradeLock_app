import 'package:go_router/go_router.dart';
import 'package:tradelock_app/features/Tradsman/pages/pending_job_details_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/mileage_page.dart';
import 'package:tradelock_app/features/onboarding/pages/onboarding_page.dart';
import 'package:tradelock_app/features/onboarding/pages/user_role_page.dart';
import 'package:tradelock_app/features/onboarding/pages/country_selection_page.dart';
import 'package:tradelock_app/features/auth/pages/login_page.dart';
import 'package:tradelock_app/features/auth/pages/register_page.dart';
import 'package:tradelock_app/features/auth/pages/verify_otp_page.dart';
import 'package:tradelock_app/features/auth/pages/complete_profile_page.dart';
import 'package:tradelock_app/features/auth/pages/congratulations_page.dart';
import 'package:tradelock_app/features/auth/pages/subscription_page.dart';
import 'package:tradelock_app/features/home/pages/home_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/tradesman_dashboard_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/calendar_page.dart';
import 'package:tradelock_app/features/client/pages/client_dashboard_page.dart';
import 'package:tradelock_app/features/client/pages/my_job_listings_page.dart';
import 'package:tradelock_app/features/client/pages/add_listing_page.dart';
import 'package:tradelock_app/features/client/pages/client_active_jobs_page.dart';
import 'package:tradelock_app/features/client/pages/client_chat_page.dart';
import 'package:tradelock_app/features/client/pages/client_job_details_page.dart';
import 'package:tradelock_app/features/company/pages/company_dashboard_page.dart';
import 'package:tradelock_app/features/client/pages/tradesman_public_profile_page.dart';
import 'package:tradelock_app/features/client/pages/release_payment_page.dart';
import 'package:tradelock_app/features/profile/pages/profile_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/add_job_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/community_fund_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/setup_jobs_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/active_jobs_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/job_details_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/receipts_page.dart';
import 'package:tradelock_app/features/profile/pages/profile_setup_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/invoices_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/invoice_details_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/trade_chat_page.dart';
import 'package:tradelock_app/features/profile/pages/edit_profile_page.dart';
import 'package:tradelock_app/features/profile/pages/disputes_page.dart';
import 'package:tradelock_app/features/profile/pages/create_dispute_page.dart';
import 'package:tradelock_app/features/profile/pages/notification_page.dart';
import 'package:tradelock_app/features/profile/pages/faq_page.dart';
import 'package:tradelock_app/features/profile/pages/terms_conditions_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/pay_overview_page.dart';
import 'package:tradelock_app/features/Tradsman/pages/rate_review_page.dart';

import 'package:get/get.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: Get.key,
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/user-role',
        builder: (context, state) => const UserRolePage(),
      ),
      GoRoute(
        path: '/country-selection',
        builder: (context, state) => const CountrySelectionPage(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/verify-otp',
        builder: (context, state) => const VerifyOtpPage(),
      ),
      GoRoute(
        path: '/complete-profile',
        builder: (context, state) => const CompleteProfilePage(),
      ),
      GoRoute(
        path: '/congratulations',
        builder: (context, state) => const CongratulationsPage(),
      ),
      GoRoute(
        path: '/subscription',
        builder: (context, state) => const SubscriptionPage(),
      ),
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/tradesman-dashboard',
        builder: (context, state) => const TradesmanDashboardPage(),
      ),
      GoRoute(
        path: '/calendar',
        builder: (context, state) => const CalendarPage(),
      ),
      GoRoute(
        path: '/client-dashboard',
        builder: (context, state) => const ClientDashboardPage(),
      ),
      GoRoute(
        path: '/my-job-listings',
        builder: (context, state) => const MyJobListingsPage(),
      ),
      GoRoute(
        path: '/add-listing',
        builder: (context, state) => const AddListingPage(),
      ),
      GoRoute(
        path: '/edit-listing',
        builder: (context, state) => const AddListingPage(isEditing: true),
      ),
      GoRoute(
        path: '/client-active-jobs',
        builder: (context, state) => const ClientActiveJobsPage(),
      ),
      GoRoute(
        path: '/client-job-details',
        builder: (context, state) => const ClientJobDetailsPage(),
      ),
      GoRoute(
        path: '/release-payment',
        builder: (context, state) => const ReleasePaymentPage(),
      ),
      GoRoute(
        path: '/tradesman-public-profile',
        builder: (context, state) => const TradesmanPublicProfilePage(),
      ),
      GoRoute(
        path: '/client-chat',
        builder: (context, state) => const ClientChatPage(),
      ),
      GoRoute(
        path: '/company-dashboard',
        builder: (context, state) => const CompanyDashboardPage(),
      ),
      GoRoute(
        path: '/company-dashboard',
        builder: (context, state) => const CompanyDashboardPage(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/profile-projects',
        builder: (context, state) => const ProfilePage(), // Placeholder
      ),
      GoRoute(
        path: '/add-job',
        builder: (context, state) => const AddJobPage(),
      ),
      GoRoute(
        path: '/community-fund',
        builder: (context, state) => const CommunityFundPage(),
      ),
      GoRoute(
        path: '/setup-jobs',
        builder: (context, state) => const SetupJobsPage(),
      ),
      GoRoute(
        path: '/active-jobs',
        builder: (context, state) => const ActiveJobsPage(),
      ),
      GoRoute(
        path: '/job-details',
        builder: (context, state) => const JobDetailsPage(),
      ),
      GoRoute(
        path: '/pending-job-details',
        builder: (context, state) => const PendingJobDetailsPage(),
      ),
      GoRoute(
        path: '/receipts',
        builder: (context, state) => const ReceiptsPage(),
      ),
      GoRoute(
        path: '/profile-setup',
        builder: (context, state) => const ProfileSetupPage(),
      ),
      GoRoute(
        path: '/edit-profile',
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: '/disputes',
        builder: (context, state) => const DisputesPage(),
      ),
      GoRoute(
        path: '/create-dispute',
        builder: (context, state) => const CreateDisputePage(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationPage(),
      ),
      GoRoute(path: '/faq', builder: (context, state) => const FAQPage()),
      GoRoute(
        path: '/terms-conditions',
        builder: (context, state) => const TermsConditionsPage(),
      ),
      GoRoute(
        path: '/invoices',
        builder: (context, state) => const InvoicesPage(),
      ),
      GoRoute(
        path: '/invoice-details',
        builder: (context, state) => const InvoiceDetailsPage(),
      ),
      GoRoute(
        path: '/pay-overview',
        builder: (context, state) => const PayOverviewPage(),
      ),
      GoRoute(
        path: '/trade-chat',
        builder: (context, state) => const TradeChatPage(),
      ),
      GoRoute(
        path: '/mileage',
        builder: (context, state) => const MileagePage(),
      ),
      GoRoute(
        path: '/rate-review',
        builder: (context, state) => const RateReviewPage(),
      ),
    ],
  );
}
