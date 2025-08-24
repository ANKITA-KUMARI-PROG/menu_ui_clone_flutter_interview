import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shope_ab/screens/auth_ui/welcome_screen.dart';
import 'package:shope_ab/utils/app_constant.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 5000), () {
      Get.offAll(()=> WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.appSecondColor,
      appBar: AppBar(backgroundColor: AppConstant.appSecondColor, elevation: 0),
      body: Container(
        decoration: BoxDecoration(color: AppConstant.appSecondColor),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.18),
              width: size.width,

              child: Lottie.asset(
                "assets/splash_icons/Scene-1 (2).json",
                fit: BoxFit.cover,
              ),
            ),
            Text(
              AppConstant.appPoveredby,
              style: AppConstant.textstyleconstant,
            ),
          ],
        ),
      ),
    );
  }
}
