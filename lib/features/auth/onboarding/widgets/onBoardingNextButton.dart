import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/size.dart';
import '../../../../core/design/colors.dart';
import '../providers/onbording_provider.dart';

class onBoardingNextButton extends ConsumerWidget {
  const onBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(onboardingPageControllerProvider);
    final notifier = ref.read(onboardingIndexProvider.notifier);

    return Positioned(
      bottom: 60,
      right: AppSizes.defaultSpace,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppColors.primaryLight,
        ),
        onPressed: () => notifier.nextPage(pageController, context),
        child: Icon(Icons.arrow_forward_ios_rounded, color:  Colors.white,),
      ),
    );
  }
}
