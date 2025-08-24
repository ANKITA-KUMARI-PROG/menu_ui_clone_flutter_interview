import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:shope_ab/screens/auth_ui/google_sign_in.dart';
import 'package:shope_ab/screens/auth_ui/sign_up_screen.dart';
import 'package:shope_ab/utils/app_constant.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}
final textSignIn = AppConstant.signIn;
    final imagegoogle = "assets/images/Google.svg";
    final textEmail = AppConstant.signInWithEmail;
class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appSecondColor,
            centerTitle: true,
            title: Text("Sign In", style: AppConstant.textstyleWelcom),
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(color: AppConstant.appBackGroundColor),
              child: Column(
                children: [
                  isKeyboardVisible
                      ? Text(AppConstant.welcomeScreen)
                      : Container(
                        decoration: BoxDecoration(color: AppConstant.appSecondColor),
                      child: Lottie.asset("assets/splash_icons/Scene-1 (2).json",height: size.height*0.4)),
            
                  SizedBox(height: size.height * 0.002),
            
                  Container(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.06),
            
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.057,
                        right: size.width * 0.057,
                      ),
                      child: TextFormField(
                        cursorColor: AppConstant.appSecondColor,
                        keyboardType: TextInputType.emailAddress,
            
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          hintText: "Enter Email",
                          prefixIcon: Icon(
                            Icons.email,
                            size: Get.size.height / 29,
                            color: AppConstant.appSecondaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                    ),
                  ),
            
                  
                 
            
                  Container(
                child: 
            
                  Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.057,
                        right: size.width * 0.057,
                      ),
                      child: TextFormField(
                        cursorColor: AppConstant.appSecondColor,
                        keyboardType: TextInputType.visiblePassword,
            
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          hintText: "Password",
                          suffixIcon: Icon(Icons.visibility_off),
                          prefixIcon: Icon(
                            Icons.password,
                            size: Get.size.height / 29,
                            color: AppConstant.appSecondaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                
              forgoogleEmail(text: AppConstant.signUp,page:  const GoogleSignIn(),  
              ),
               SizedBox(height: size.height * 0.04),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(AppConstant.dontHaveAnAccount,style: AppConstant.textStyleDontHaveAccount),
                   GestureDetector(onTap: () => Get.offAll(SignUpScreen()),
                    child: Text(AppConstant.signUp,style: AppConstant.textStyleSignUp,))
                ],)],
              ),
            ),
          ),
        );
      },
    );
  }

    Widget forgoogleEmail({ required String text, required Widget page} ) {
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
          height: 50,
          width: 200,
          margin: EdgeInsets.only(right: 30, left: 30,top: 10),
          decoration: BoxDecoration(
            color: AppConstant.appSecondaryColor,
            borderRadius: BorderRadius.circular(25),
          ),

          alignment: Alignment.center,

        child:

              Text(text, style: AppConstant.textStyleSignInwithGoogle),


          
        ),
      ),
    );
  }
}
