import 'package:flutter/material.dart';

import '../../controllers/onboarding_controller.dart';

class Onboardinglefticon extends StatelessWidget {
  const Onboardinglefticon({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: size.height * 0.05,
      left: size.width * 0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: CircleBorder()),
        onPressed: () {
          OnboardingController.instance.nextLexfPage();
        },
        child: Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
