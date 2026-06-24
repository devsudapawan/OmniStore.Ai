


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:omni_store_ai/features/auth/login/presentation/otp_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../data/local/isar/isar_services.dart';
import '../../features/auth/login/presentation/login_screen.dart';
import '../../features/auth/onboarding/view/onboarding.dart';
import '../../features/auth/splesh/splesh.dart';
import '../../features/business_setup/presentation/screens/select_store_type_screen.dart';
import '../../features/dashboard/presentation/bottom_nav_bar.dart';
import '../../features/pos/presentation/screens/pos_screen.dart';
import '../../features/customers/presentation/customer_detail_screen.dart';
import 'go_router_refresh_stream.dart';
//
// // ── Async provider: checks Isar once on startup ──
// final businessExistsProvider = FutureProvider<bool>((ref) async {
//   return IsarService.businessExists();
// });

final setupCompletedProvider = FutureProvider<bool>((ref) async {
  return IsarService.setupCompleted();
});

final appRouterProvider = Provider<GoRouter>((ref) {
  final supabase = Supabase.instance.client;

  // Watch the business check — router rebuilds when this resolves
  // final businessAsyncValue = ref.watch(businessExistsProvider);
  // final businessExists = businessAsyncValue.asData?.value ?? false;
  final setupAsyncValue = ref.watch(setupCompletedProvider);
  final setupCompleted = setupAsyncValue.asData?.value ?? false;

  return GoRouter(
    initialLocation: Routes.SPLASH,

    refreshListenable: GoRouterRefreshStream(
      supabase.auth.onAuthStateChange,
    ),

    redirect: (context, state) {
      final session = supabase.auth.currentSession;
      final isLoggedIn = session != null;
      final location = state.matchedLocation;

      final isSplash     = location == Routes.SPLASH;
      final isOnboarding = location == Routes.ONBOARDING;
      final isLogin      = location == Routes.LOGIN;
      final isCreate     = location == Routes.CREATEACCOUNT;
      final isStoreSetup = location == Routes.STORE_SETUP;
      final isOtp        = location == Routes.OTPSCREEN;

      // 1. Always allow splash — SplashPage handles its own navigation
      if (isSplash) return null;

      // 2. Not logged in + accessing protected page → login
      if (!isLoggedIn &&
          !(isOnboarding || isLogin || isCreate || isOtp)) {
        return Routes.LOGIN;
      }

      // 3. Logged in + on auth pages → check if business exists
      // if (isLoggedIn && (isLogin || isCreate || isOnboarding || isOtp)) {
      //   return businessExists ? Routes.BOTTOMNAVBAR : Routes.STORE_SETUP;
      // }

      if (isLoggedIn && (isLogin || isCreate || isOnboarding || isOtp)) {
        return setupCompleted ? Routes.BOTTOMNAVBAR : Routes.STORE_SETUP;
      }

      // 4. Logged in + on store setup but business already created → dashboard
      // if (isLoggedIn && isStoreSetup && businessExists) {
      //   return Routes.BOTTOMNAVBAR;
      // }
      if (isLoggedIn && isStoreSetup && setupCompleted) {
        return Routes.BOTTOMNAVBAR;
      }

      // 5. Logged in + anywhere else but no business → setup
      // if (isLoggedIn &&
      //     !businessExists &&
      //     !isStoreSetup) {
      //   return Routes.STORE_SETUP;
      // }
      if (isLoggedIn && !setupCompleted && !isStoreSetup) {
        return Routes.STORE_SETUP;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: Routes.SPLASH,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: Routes.ONBOARDING,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: Routes.LOGIN,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.OTPSCREEN,
        builder: (context, state) => OtpScreen(
          email: state.extra as String,
        ),
      ),
      GoRoute(
        path: Routes.STORE_SETUP,
        builder: (context, state) => const SelectStoreTypeScreen(),
      ),
      GoRoute(
        path: Routes.BOTTOMNAVBAR,
        builder: (context, state) => const BottomNavBar(),
      ),
      GoRoute(
        path: Routes.addSale,
        builder: (context, state) => const PosScreen(),
      ),
      GoRoute(
        name: 'customer_detail',
        path: Routes.customerDetail,
        builder: (context, state) => CustomerDetailScreen(
          customerId: state.extra as String,
        ),
      ),
    ],
  );
});

class Routes {
  static const SPLASH        = '/';
  static const ONBOARDING    = '/onboarding';
  static const LOGIN         = '/login';
  static const OTPSCREEN     = '/otp-screen';
  static const CREATEACCOUNT = '/createaccount';
  static const STORE_SETUP   = '/store-setup';
  static const BOTTOMNAVBAR  = '/bottomnavbar';
  static const HOME          = '/home';
  static const CUSTOMERS     = '/customers';
  static const INVENTORY     = '/inventory';
  static const RECORDS       = '/records';
  static const SETTINGS      = '/settings';
  static const addSale       = '/add-sale';
  static const customerDetail= '/customer-detail';
  static const ASSISTANT     = '/assistant';
}