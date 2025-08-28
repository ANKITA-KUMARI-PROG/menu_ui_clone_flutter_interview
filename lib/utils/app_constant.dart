import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant {
  //// strings
  static String appMainName = "shop_ab";
  static String appPoveredby = "Powered By Anki";
  static String forgetPassword = "Forget password?";
  static String welcomeScreen = "Most Welcome";
  static String welcomeScreenHappyShopping = "Happy Shopping";
  static String signIn1 = "Sign In ";
  static String dontHaveAnAccount = "Don't Have An Account? ";
  static String alreadyHaveAnAccount = "Already Have An Account? ";
  static String signInWithGoogle = "Sign In with Google";
  static String signInWithEmail = "Sign In with Email";
  static String connectWithBusiness =
      "Connect with Businesses in your area like never before";
  static String getRevardforbeign =
      "Get rewarded for being a loyal customer & in return help your local business owners improve your experience.";

  static String earnReard = "Earn Reward Points";
  static String earnReard1 =
      "Earn reward points by checking into your favorite businesses using the app";
  static String earnReard2 =
      "Participate in Frequenter Challenges to get additional points";
  static String earnReard3 =
      "Engage in contests, provide feedback, and earn rewards if your feedback is voted best";
  static String earnReard4 =
      "Earn points by competing in games like City-wide Treasure Hunt, Business Trivia, and Photo Quest";
  static String redeem = "Redeem Points for Rewards";
  static String redeem1 = "Exclusive discounts at local businesses";
  static String redeem2 = "Redeem points for free rewards";
  static String redeem3 = "Earn more points with higher tiers";
  static String redeem4 = "Get exclusive invitations as a preferred customer";

  static const String welcomeText = "Welcome!";
  static const String emailHint = "Email Address";
  static const String passwordHint = "Password";
  static const String forgotPassword = "Forgot password?";
  static const String signInText = "Login";
  static const String dontHaveAccount = "Not a member?";
  static const String signUpText = "Sign Up";
  static const String orContinueWith = "Or continue with";

  // Sign Up Screen Constants

  static const String createAccountText = "Create an account to get started";
  static const String nameHint = "Name";
  static const String phoneHint = "Phone Number";
  static const String dobHint = "Date of birth";
  static const String confirmPasswordHint = "Confirm password";
  static const String alreadyHaveAccount = "Already a member?";
  static const String termsPart1 = "I've read and agree with the ";
  static const String termsPart2 = "Terms and Conditions";
  static const String termsPart3 = " and the ";
  static const String termsPart4 = "Privacy Policy";

  // Verification Screen Constants
  static const String verificationTitle = "Enter confirmation code";
  static const String verificationDescription = "A 4-digit code was sent to\n";
  static const String verificationHelp =
      "Enter the 4-digit code sent to your email";
  static const String resendCode = "Resend code";
  static const String continueText = "Continue";
  static const String codeResentMessage = "Verification code sent successfully";

  static const String sentmail = "Email sent!";
  static const String sentaPassword =
      "We’ve sent a password reset link to your email. Use this link to change your password.";
  static const String dontgetalink = "Didn’t get a link?";
  static const String resetlink = "Resend Link";

  /// colors
  static const appMainColor = Color(0xFF51A2FF);
  static const appBackGroundColor = Color(0xFFF5F5F4);
  static const appSecondColor = Color(0xFF08979C);
  static const appSecondaryColor = Color(0xFF08979C);
  static const appTextlightColor = Color(0xFFA6A09B);
  static const appTextOriginalColor = Color(0xFF0C0A09);
  static const appTextNormalColor = Color(0xFF44403B);
  static const appTextWhiteColor = Color(0xFFFAFAF9);
  static const appBarStatusColor = Color(0xFFF8FAFC);
  static const appErrorColor = Color(0xFFC71D36);
  static Color onboardingtext1 = Color(0xFF71727A);
  //// color sin in
  ///
  ///
  ///
  ///
  static const Color appBackgroundColor = Color(0xFFFFFFFF);
  static const Color appPrimaryColor = Color(0xFF08979C);
  static const Color appSecondaryColorblack = Color(0xFF000000);
  static const Color appTextColor = Color(0xFF000000);
  static const Color appIconColor = Color(0xFF9E9E9E);
  static const Color appBorderColor = Color(0xFFE0E0E0);
  static const Color appDividerColor = Color(0xFFE0E0E0);

  // Colors
  static const Color appSuccessColor = Color(0xFF4CAF50);
  static const Color appCardColor = Color(0xFFF5F5F5);

  ///  images
  static const imagegoogle = "assets/images/Google.svg";
  static const imageEmail = "assets/images/email.jpg";

  /// textstyle
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

  static TextStyle textstyleonboarding1 = GoogleFonts.inter(
    color: AppConstant.onboardingtext1,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 16 / 12,
    letterSpacing: 0.24,
  );

  static TextStyle earnrewardstextstyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400, // Regular
    fontStyle: FontStyle.normal,
    fontSize: 13,
    height: 16 / 13, // line-height ratio
    letterSpacing: 0.13,
    color: AppConstant.onboardingtext1, // 1% of 13px
  );

  static TextStyle textstyleonboardingbusiness = GoogleFonts.inter(
    color: AppConstant.appTextOriginalColor,
    fontSize: 24,

    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.normal,
    height: 1.0,
    letterSpacing: 0.24,
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
    color: AppConstant.appSecondaryColorblack,
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

  ///  signUpscreen Textstyle
  ///
  // Additional Text Styles
  static TextStyle textStyleTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: appTextColor,
  );

  static TextStyle textStyleSubtitle = TextStyle(
    fontSize: 16,
    color: appTextColor,
  );

  /////  222. sign in

  // Text Styles
  static TextStyle textStyleWelcome = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: appTextColor,
  );

  static TextStyle textStyleHint = TextStyle(fontSize: 16, color: appIconColor);

  static TextStyle textStyleForgotPassword = TextStyle(
    fontSize: 14,
    color: appPrimaryColor,
  );

  static TextStyle textStyleButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: appBackgroundColor,
  );

  static TextStyle textStyleNormal = TextStyle(
    fontSize: 14,
    color: appTextColor,
  );

  static TextStyle textStyleLink = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: appPrimaryColor,
  );

  static TextStyle textStyleGoogleButton = TextStyle(
    fontSize: 16,
    color: appTextColor,
  );

  // Text Styles

  static TextStyle textStyleBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: appTextColor,
  );

  //// animation duration

  static const Duration pageAnimationDuration = Duration(milliseconds: 500);
  static const Duration indicatorAnimationDuration = Duration(
    milliseconds: 300,
  );
}
