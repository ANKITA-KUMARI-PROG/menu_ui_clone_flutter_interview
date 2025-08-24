import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:shope_ab/screens/auth_ui/google_sign_in.dart';
import 'package:shope_ab/screens/auth_ui/sign_in.dart';
import 'package:shope_ab/utils/app_constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
final textSignUpScreen = AppConstant.signUp;
    final imagegoogle = "assets/images/Google.svg";

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appSecondColor,
            centerTitle: true,
            title: Text(AppConstant.signUp, style: AppConstant.textstyleWelcom),
          ),
          body: 
                  
          
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(color: AppConstant.appBackGroundColor),
              child:  
              
               Column(
                
                children: [
                   isKeyboardVisible
                      ? Text(AppConstant.welcomeScreen, style: AppConstant.textStyleSignInwithGoogle,)
                      : 
                  Container(alignment: Alignment.center,
                    child: Text(AppConstant.welcomeScreen, style: AppConstant.textstyleWelcom,)),
                      
                      
                    
            
                
            
                  Container(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.057,
                        right: size.width * 0.057,
                      ),
                      child: TextFormField(
                        cursorColor: AppConstant.appSecondColor,
                        keyboardType: TextInputType.name,
            
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          hintText: "User Name",
                          prefixIcon: Icon(
                            Icons.person,
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
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.057,
                        right: size.width * 0.057,
                      ),
                      child: TextFormField(
                        cursorColor: AppConstant.appSecondColor,
                        keyboardType: TextInputType.numberWithOptions(decimal: false),
            
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          hintText: "Phone",
                          prefixIcon: Icon(
                            Icons.phone,
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
                   margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.057,
                        right: size.width * 0.057,
                      ),
                      child: TextFormField(
                        cursorColor: AppConstant.appSecondColor,
                        keyboardType: TextInputType.streetAddress,
            
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          hintText: "City",
                          prefixIcon: Icon(
                            Icons.location_city,
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
                   margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.057,
                        right: size.width * 0.057,
                      ),
                      child: TextFormField(
                        cursorColor: AppConstant.appSecondColor,
                        keyboardType: TextInputType.visiblePassword,
            
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
                     margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                child: 
            
                  Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.057,
                        right: size.width * 0.057,
                      ),
                      child: TextFormField(
                        cursorColor: AppConstant.appSecondColor,
                        keyboardType: TextInputType.emailAddress,
            
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
                Container( margin: EdgeInsets.only(right: 30),
                  alignment: Alignment.centerRight,
                  child: Text(AppConstant.forgetPassword,style: TextStyle(color: AppConstant.appErrorColor, fontWeight: FontWeight.bold), ),),
                    SizedBox(height: size.height*0.02,),
              forgoogleEmail(text: textSignUpScreen,page:  const GoogleSignIn(),  
              ),
               SizedBox(height: size.height * 0.04),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(AppConstant.alreadyHaveAnAccount,style: AppConstant.textStyleDontHaveAccount),
                   
                   GestureDetector(onTap: () => Get.offAll(()=>SignIn()),
                    child: Text(AppConstant.signIn,style: AppConstant.textStyleSignUp,))
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
