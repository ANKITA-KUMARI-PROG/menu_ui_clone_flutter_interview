// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../controllers/onboarding_controller.dart';

class onboardingnextbutton extends StatelessWidget {
  const onboardingnextbutton({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: size.height * 0.05,
      right: size.width * 0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: CircleBorder(),
        ),
        onPressed: () {
          OnboardingController.instance.nextPage();
        },
        child: Icon(Icons.arrow_forward_ios_outlined, size: 15,),
        
      ),
    );
  }
}
