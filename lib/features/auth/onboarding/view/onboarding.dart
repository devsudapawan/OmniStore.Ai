import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/image_String.dart';
import '../../../../core/constants/text_String.dart';
import '../providers/onbording_provider.dart';
import '../widgets/onBoardingDotNavigation.dart' hide onboardingPageControllerProvider, onboardingIndexProvider;
import '../widgets/onBoardingNextButton.dart';
import '../widgets/onBoardingPage.dart';
import '../widgets/onBoardingSkip.dart';
class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(onboardingPageControllerProvider);
    final indexNotifier = ref.read(onboardingIndexProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: indexNotifier.updateIndex,
            children: const [
              onBoardingWidget(images: AppImages.onBoardingImage1),
              onBoardingWidget(images: AppImages.onBoardingImage2),
              onBoardingWidget(images: AppImages.onBoardingImage3),
            ],
          ),

          // const onBoardingSkip(),
          const onBoardingDotNavigation(),
          const onBoardingNextButton()
        ],
      ),
    );
  }
}

