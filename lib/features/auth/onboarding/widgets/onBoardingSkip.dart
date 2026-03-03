import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omni_store_ai/core/design/colors.dart';
import '../../../../core/constants/size.dart';
import '../providers/onbording_provider.dart';

class onBoardingSkip extends ConsumerWidget {
  const onBoardingSkip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(onboardingPageControllerProvider);
    final notifier = ref.read(onboardingIndexProvider.notifier);

    return Positioned(
      top: AppSizes.spaceBtwSections,
      right: AppSizes.defaultSpace,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white
        ),
        child: Text("Skip",style: TextStyle(color: AppColors.primaryLight,fontSize: 14),),
      )
    );
  }
}
