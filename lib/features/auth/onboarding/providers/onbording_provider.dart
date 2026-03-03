//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../../app/routes/app_routes.dart';
//
// /// ----------------------------
// /// PageController Provider
// /// ----------------------------
// final onboardingPageControllerProvider = Provider<PageController>((ref) {
//   return PageController();
// });
//
// /// ----------------------------
// /// Onboarding Index Provider
// /// ----------------------------
// final onboardingIndexProvider =
// NotifierProvider<OnboardingIndexNotifier, int>(() {
//   return OnboardingIndexNotifier();
// });
//
// class OnboardingIndexNotifier extends Notifier<int> {
//   @override
//   int build() => 0;
//
//   /// Update page index
//   void updateIndex(int index) => state = index;
//
//   /// Jump to a specific page
//   void jumpToPage(PageController controller, int index) {
//     controller.jumpToPage(index);
//     state = index;
//   }
//
//   /// Next Page Logic
//   void nextPage(PageController controller, BuildContext context) {
//     if (state == 2) {
//       /// Last page → go to login using GoRouter
//       context.go(Routes.LOGIN);
//     } else {
//       final next = state + 1;
//       controller.jumpToPage(next);
//       state = next;
//     }
//   }
//
//   /// Skip onboarding → go to last page
//  /// Skip onboarding → go to last page
//    void skipToLast(PageController controller) {
//      controller.jumpToPage(2);
//      state = 2;
//    }}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/app_routes.dart';

// ✅ Use StateProvider so it's disposed properly
final onboardingPageControllerProvider =
Provider.autoDispose<PageController>((ref) {
  final controller = PageController();
  ref.onDispose(controller.dispose); // ← important!
  return controller;
});

final onboardingIndexProvider =
NotifierProvider<OnboardingIndexNotifier, int>(() {
  return OnboardingIndexNotifier();
});

class OnboardingIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void updateIndex(int index) => state = index;

  void nextPage(PageController controller, BuildContext context) {
    if (state == 2) {
      context.go(Routes.LOGIN); // ← last page → go to login
    } else {
      final next = state + 1;
      controller.animateToPage(  // ← animateToPage looks smoother than jumpToPage
        next,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      state = next;
    }
  }

  //   /// Jump to a specific page
  void jumpToPage(PageController controller, int index) {
    controller.jumpToPage(index);
    state = index;
  }//   /// Jump to a specific page
//   void jumpToPage(PageController controller, int index) {
//     controller.jumpToPage(index);
//     state = index;
//   }

  void skipToLast(PageController controller) {
    controller.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    state = 2;
  }
}
//```
//
//---
//
//### Flow Summary
//```
//App Launch
//↓
//Native Splash (flutter_native_splash) shown while IsarService.init()
//↓
//FlutterNativeSplash.remove()
//↓
//GoRouter initialLocation = "/"  (SplashPage)
//↓
//redirect fires immediately:
//├── isLoggedIn  → /bottomnavbar
//└── !isLoggedIn → /onboarding
//↓
//User swipes pages
//↓
//Last page → /login