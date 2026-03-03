

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:omni_store_ai/features/auth/login/presentation/otp_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../features/auth/login/presentation/login_screen.dart';
import '../../features/auth/onboarding/view/onboarding.dart';
import '../../features/auth/splesh/splesh.dart';
import 'go_router_refresh_stream.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final supabase = Supabase.instance.client;

  return GoRouter(
    initialLocation: Routes.SPLASH,

    refreshListenable: GoRouterRefreshStream(
      supabase.auth.onAuthStateChange,
    ),

    redirect: (context, state) {
      final session = supabase.auth.currentSession;
      final isLoggedIn = session != null;
      final location = state.matchedLocation;

      final isOnboarding = location == Routes.ONBOARDING;
      final isLogin      = location == Routes.LOGIN;
      final isCreate     = location == Routes.CREATEACCOUNT;

      // ✅ REMOVED the isSplash block — SplashPage handles its own navigation

      // 2. Not logged in + trying to access protected page → login
      if (!isLoggedIn && !(isOnboarding || isLogin || isCreate || location == Routes.SPLASH)) {
        return Routes.LOGIN;
      }

      // 3. Logged in + trying to access auth pages → home
      if (isLoggedIn && (isLogin || isCreate || isOnboarding)) {
        return Routes.BOTTOMNAVBAR;
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
      // GoRoute(
      //   path: Routes.BOTTOMNAVBAR,
      //   builder: (context, state) => const BottomNavBar(),
      // ),
    ],
  );
});

class Routes {
  static const SPLASH        = "/";
  static const ONBOARDING    = "/onboarding";
  static const LOGIN         = "/login";
  static const OTPSCREEN         = "/otp-screen";
  static const CREATEACCOUNT = "/createaccount";
  static const BOTTOMNAVBAR  = "/bottomnavbar";
  static const HOME          = "/home";
// ... rest of your routes
}