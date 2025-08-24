import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:shope_ab/screens/auth_ui/email_sign_in.dart';
import 'package:shope_ab/screens/auth_ui/google_sign_in.dart';
import 'package:shope_ab/utils/app_constant.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}


class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textgoogle = AppConstant.signInWithGoogle;
    final imagegoogle = "assets/images/Google.svg";
    final textEmail = AppConstant.signInWithEmail;
   
   
   
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstant.welcomeScreen,
          style: AppConstant.textstyleWelcom,
        ),
        backgroundColor: AppConstant.appSecondColor,
        elevation: 0,
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            child: Lottie.asset("assets/splash_icons/Scene-1 (2).json"),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: size.height * 0.028),
            child: Text(
              AppConstant.welcomeScreenHappyShopping,
              style: AppConstant.textstyleHappyShooping,
            ),
          ),
         
         SizedBox(height: size.height*0.22,),
          forgoogleEmail(image: imagegoogle,text: textgoogle,page:  const GoogleSignIn(),  
         ),
          
         SizedBox(height: size.height*0.02,),
          forgoogleEmail(image: AppConstant.imageEmail,text: textEmail,page: const EmailSignIn(),
          ),
          
        ],
      ),
    );
  }

  Widget forgoogleEmail({required String image, required String text, required Widget page} ) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>page),
        );
      },
      
      child: 
      Padding(
        padding: const EdgeInsets.only(),
        child: Container(
          margin: EdgeInsets.only(right: 30, left: 30,top: 20),
          decoration: BoxDecoration(
            color: AppConstant.appSecondaryColor,
            borderRadius: BorderRadius.circular(25),
          ),

          alignment: Alignment.center,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Image.asset(
                image,
                height: Get.height / 12,
                width: Get.width / 12,
              ),
              SizedBox(width: Get.width / 08),

              Text(text, style: AppConstant.textStyleSignInwithGoogle),
            ],
          ),
        ),
      ),
    );
  }
}
