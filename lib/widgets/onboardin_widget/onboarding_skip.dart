import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_ab/controllers/onboarding_controller.dart';
import 'package:shope_ab/screens/auth_ui/sign_in.dart';
import 'package:shope_ab/utils/app_constant.dart';

// ignore: camel_case_types
class skipbutton extends StatelessWidget {
  const skipbutton({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.04,
      right: size.width * 0.07,
      child: TextButton(
        onPressed: () {
          Get.to(() => SignInScreen());
        },
        child: Text(
          "skip",
          style: TextStyle(color: AppConstant.appTextOriginalColor),
        ),
      ),
    );
  }
}
