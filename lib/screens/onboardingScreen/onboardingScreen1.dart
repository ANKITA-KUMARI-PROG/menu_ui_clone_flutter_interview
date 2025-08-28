// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shope_ab/controllers/onboarding_controller.dart';
import 'package:shope_ab/utils/app_constant.dart';
import 'package:shope_ab/widgets/onboardin_widget/onboardinglefticon.dart';


import '../../widgets/onboardin_widget/onbarding_widget_primary.dart';
import '../../widgets/onboardin_widget/onboarding_navigation.dart';
import '../../widgets/onboardin_widget/onboarding_skip.dart';
import '../../widgets/onboardin_widget/onboardingnextbutton.dart';

class Onboardingscreen1 extends StatefulWidget {
  const Onboardingscreen1({super.key});

  @override
  State<Onboardingscreen1> createState() => _Onboardingscreen1State();
}

class _Onboardingscreen1State extends State<Onboardingscreen1> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    final size = MediaQuery.of(context).size;
  
    return Scaffold(
      // hozional scoll view
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              onboardingpage(
                size: size,
                title: AppConstant.connectWithBusiness,
                subtitle: AppConstant.getRevardforbeign,
                image: 'assets/images/onb1.png',
               
              ),

              onboardingpage1(

                size: size,
                title:  AppConstant.earnReard,
                title1: AppConstant.earnReard1,
                title2: AppConstant.earnReard2,
                titlt3: AppConstant.earnReard3,
                title4: AppConstant.earnReard4,
                
                image: 'assets/images/onb2.png',
               
              ),
              onboardingpage2(
                size: size,
                title:  AppConstant.redeem,
                title1: AppConstant.redeem1,
                title2: AppConstant.redeem2,
                titlt3: AppConstant.redeem3,
                title4: AppConstant.redeem4,
                image: 'assets/images/onb3.png',
               
              ),
            ],
          ),

          /// skip button
          skipbutton(size: size),

          /// smooth page indicator package
          ///
          ///
          onboardingnavigation(size: size),
          
          //
        
          // circular button
          onboardingnextbutton(size: size),

          Obx(() {
            return controller.currentpageindex.value == 0
                ? const SizedBox.shrink() // hide
                : Onboardinglefticon(size: size); // show
          }),
         
        ],
      ),
    );

  }
}

