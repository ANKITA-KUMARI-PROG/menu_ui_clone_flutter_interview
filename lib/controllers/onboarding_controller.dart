// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


import '../screens/auth_ui/sign_in.dart';


class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentpageindex = 0.obs;

  void updatePageIndicator(index) => currentpageindex.value = index;

  // void dotNavigationClick(index) {
  //   currentpageindex.value = index;
  //   Get.to;
  // }

  void nextPage() {
    if (currentpageindex == 2) {
      Get.to(SignInScreen());
    } else {
      int page = currentpageindex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void nextLexfPage() {
 
    if (currentpageindex == 3) {
      Get.to(SignInScreen());
    } else {
      int page = currentpageindex.value - 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentpageindex.value = 2;
    pageController.jumpToPage(2);
  }
}
