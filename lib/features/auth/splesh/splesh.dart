import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/constants/image_String.dart';
import '../../../core/design/colors.dart';
import '../../../app/routes/app_routes.dart';

class SplashPage extends ConsumerStatefulWidget {   // ← needs StatefulWidget for initState
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {

  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;   // ← safety check after async gap

    final session = Supabase.instance.client.auth.currentSession;
    final isLoggedIn = session != null;

    if (isLoggedIn) {
      context.go(Routes.BOTTOMNAVBAR);
    } else {
      context.go(Routes.ONBOARDING);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteOff,
      body: Center(
        child: Image.asset(
          AppImages.splashImage,
          width: 350,
          height: 350,
        ),
      ),
    );
  }
}