// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:supabase_flutter/supabase_flutter.dart';
// //
// // import 'app/routes/app_routes.dart';
// // import 'core/theme/theme.dart';
// // import 'data/local/isar/collections/customer.dart';
// // import 'data/local/isar/isar_services.dart';
// //
// //
// //
// // Future<void> main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await IsarService.init();
// //   await Supabase.initialize(
// //     url: 'network://dygmmsygckjnrhcrprne.supabase.co',
// //     anonKey: 'sb_publishable_YXnXQ-mRjaKc48AkagpHlA_e700ee1n',
// //   );
// //   // await Firebase.initializeApp(
// //   //   options: DefaultFirebaseOptions.currentPlatform,
// //   // );
// //
// //   runApp(const ProviderScope(child: MyApp()));
// // }
// //
// // class MyApp extends ConsumerWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final router = ref.watch(appRouterProvider); // riverpod router provider
// //
// //     return MaterialApp.router(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Omni Store Ai',
// //       theme: AppTheme.lightTheme,
// //       darkTheme: AppTheme.darkTheme,
// //       routerConfig: router,
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'data/local/isar/isar_services.dart';
// import 'features/customers/presentation/customer_list_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//
//   await IsarService.init();
//
//   runApp(const ProviderScope(child: MyApp()));
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'OmniStore.Ai',
//       // home: const AddCustomerScreen(),
//       home: const CustomerListScreen(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/bootstrap/supabase_initializer.dart';
import 'app/routes/app_routes.dart';
import 'data/local/isar/isar_services.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); // ← keep native splash
  await SupabaseInitializer.init();
  await IsarService.init();
  // await Supabase.initialize(
  //   url: 'network://dygmmsygckjnrhcrprne.supabase.co',
  //   anonKey: 'sb_publishable_YXnXQ-mRjaKc48AkagpHlA_e700ee1n',
  // );
  FlutterNativeSplash.remove(); // ← dismiss after init done

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {       // ← ConsumerWidget (not StatelessWidget)
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider); // ← watch GoRouter

    return MaterialApp.router(              // ← MaterialApp.router (not MaterialApp)
      debugShowCheckedModeBanner: false,
      title: 'OmniStore.Ai',
      routerConfig: router,                 // ← pass GoRouter here
    );
  }
}