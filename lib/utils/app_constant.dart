import 'package:flutter/widgets.dart';

class AppConstant {
  static String appMainName = "shop_ab";
  static String appPoveredby = "Powered By Anki";
  static String forgetPassword = "Forget password?";
  static String welcomeScreen = "Most Welcome";
  static String welcomeScreenHappyShopping = "Happy Shopping";
  static String signIn = "Sign In ";
  static String dontHaveAnAccount = "Don't Have An Account? ";
  static String alreadyHaveAnAccount = "Already Have An Account? ";
  static String signUp = "Sign Up ";
  static String signInWithGoogle = "Sign In with Google";
  static String signInWithEmail = "Sign In with Email";
  
  static const appMainColor = Color(0xFF51A2FF);
  static const appBackGroundColor = Color(0xFFF5F5F4);
  static const appSecondColor = Color(0xFF2B7FFF);
  static const appSecondaryColor = Color(0xFF7C86FF);
  static const appTextlightColor = Color(0xFFA6A09B);
  static const appTextOriginalColor = Color(0xFF0C0A09);
  static const appTextNormalColor = Color(0xFF44403B);
  static const appTextWhiteColor = Color(0xFFFAFAF9);
  static const appBarStatusColor = Color(0xFFF8FAFC);
  static const appErrorColor = Color(0xFFC71D36);
  static const imagegoogle = "assets/images/Google.svg";
  static const imageEmail = "assets/images/email.jpg";

  static TextStyle textstyleconstant = TextStyle(
    color: AppConstant.appTextWhiteColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textstyleWelcom = TextStyle(
    color: AppConstant.appTextWhiteColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textstyleHappyShooping = TextStyle(
    color: AppConstant.appTextOriginalColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyleSignInwithGoogle = TextStyle(
    color: AppConstant.appTextOriginalColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    decorationColor: Color(0xFF7C86FF),
  );
  static TextStyle textStyleSignUp = TextStyle(
    color: AppConstant.appErrorColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    decorationColor: Color(0xFF7C86FF),
  );
  static TextStyle textStyleDontHaveAccount = TextStyle(
    color: AppConstant.appErrorColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    decorationColor: Color(0xFF7C86FF),
  );
}
