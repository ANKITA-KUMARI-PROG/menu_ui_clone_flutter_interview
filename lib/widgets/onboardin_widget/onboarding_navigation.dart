import 'package:flutter/material.dart';
import 'package:shope_ab/controllers/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboardingnavigation extends StatelessWidget {
  const onboardingnavigation({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
      top: size.height * 0.52,
      left: size.width * 0.05,

      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        effect: ColorTransitionEffect(
          paintStyle: PaintingStyle.fill,
          dotHeight: size.height * 0.018,
          dotWidth: size.width * 0.04,
          dotColor: Color(0xFFA6A09B),
        ),
      ),
    );
  }
}
