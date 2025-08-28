import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:shope_ab/screens/auth_ui/dashboard_screen.dart';
import 'package:shope_ab/screens/auth_ui/verification_screen.dart';
import 'package:shope_ab/utils/app_constant.dart';

class SentEmailScreen extends StatelessWidget {
  const SentEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppConstant.appBackGroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppConstant.appBackGroundColor,
            leading: IconButton(
              onPressed: () {
                Get.offAll(() =>VerificationScreen(),
                
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.05),

                /// Email Icon
                Image.asset(
                  "assets/splash_icons/mail.png",
                  height: size.height * 0.25,
                ),

                SizedBox(height: size.height * 0.02),

                /// Title
                Text(
                  AppConstant.sentmail,
                  style: AppConstant.textStyleTitle.copyWith(
                    fontSize: size.height * 0.024,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: size.height * 0.015),

                /// Description
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: Text(
                    AppConstant.sentaPassword,
                    style: AppConstant.textStyleSubtitle.copyWith(
                      fontSize: size.height * 0.016,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                /// Reset link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppConstant.dontgetalink,
                      style: AppConstant.textStyleSubtitle.copyWith(
                        fontSize: size.height * 0.015,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAll(() => DashboardScreen(),
                          
                        );
                      },
                      child: Text(
                        AppConstant.resetlink,
                        style: TextStyle(
                          color: AppConstant.appPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
