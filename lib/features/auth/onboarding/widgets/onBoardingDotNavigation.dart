import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/constants/size.dart';
import '../../../../core/design/colors.dart';
import '../providers/onbording_provider.dart';

class onBoardingDotNavigation extends ConsumerWidget {
  const onBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(onboardingPageControllerProvider);
    final notifier = ref.read(onboardingIndexProvider.notifier);

    return Positioned(
      bottom: 70,
      left: AppSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: pageController,
        count: 3,
        onDotClicked: (index) => notifier.jumpToPage(pageController, index),
        effect: ExpandingDotsEffect(
          activeDotColor:  AppColors.primaryLight ,
          dotHeight: 6,
        ),
      ),
    );
  }
}

