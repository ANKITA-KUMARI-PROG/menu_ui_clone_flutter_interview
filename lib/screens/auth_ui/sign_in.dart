import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:shope_ab/screens/auth_ui/dashboard_screen.dart';
import 'package:shope_ab/screens/auth_ui/sign_up_screen.dart';
import 'package:shope_ab/utils/app_constant.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          backgroundColor: AppConstant.appBackgroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.07),

                  /// Top illustration
                  Image.asset(
                    "assets/images/welcome.png",
                    height: size.height * 0.3,
                    fit: BoxFit.contain,
                  ),

                  SizedBox(height: size.height * 0.02),

                  /// Welcome text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome!",
                      style: AppConstant.textStyleWelcome,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),

                  /// Email field
                  TextFormField(
                    cursorColor: AppConstant.appPrimaryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: AppConstant.emailHint,
                      hintStyle: AppConstant.textStyleHint,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: AppConstant.appIconColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppConstant.appBorderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppConstant.appPrimaryColor,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),

                  /// Password field
                  TextFormField(
                    cursorColor: AppConstant.appPrimaryColor,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: AppConstant.passwordHint,
                      hintStyle: AppConstant.textStyleHint,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: AppConstant.appIconColor,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppConstant.appIconColor,
                        ),
                        onPressed: () {
                          setState(() => _obscureText = !_obscureText);
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppConstant.appBorderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppConstant.appPrimaryColor,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),

                  /// Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        AppConstant.forgotPassword,
                        style: AppConstant.textStyleForgotPassword,
                      ),
                    ),
                  ),

                  /// Login button
                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(() => DashboardScreen()
                          
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstant.appPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        AppConstant.signInText,
                        style: AppConstant.textStyleButton,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),

                  /// Sign up prompt
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppConstant.dontHaveAccount,
                        style: AppConstant.textStyleNormal,
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => Get.to(() => const SignUpScreen()),
                        child: Text(
                          AppConstant.signUpText,
                          style: AppConstant.textStyleLink,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),

                  /// Divider with OR
                  Divider(color: AppConstant.appDividerColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      AppConstant.orContinueWith,
                      style: AppConstant.textStyleNormal,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),

                  /// Social login buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(
                        "assets/images/gogle_icon.png",
                        size,
                        Colors.red,
                      ),
                      SizedBox(width: size.width * 0.05),
                      _buildSocialButton(
                        "assets/images/applebutton.png",
                        size,
                        Colors.black,
                      ),
                      SizedBox(width: size.width * 0.05),
                      _buildSocialButton(
                        "assets/images/facebook.png",
                        size,
                        Colors.blue,
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.05),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Helper Widget for circular social buttons
  Widget _buildSocialButton(String asset, Size size, Color colors) {
    return Container(
      width: size.width * 0.13,
      height: size.width * 0.13,
      decoration: BoxDecoration(
        color: colors,
        shape: BoxShape.circle,
        border: Border.all(color: colors),
      ),
      child: Center(
        child: Image.asset(
          asset,
          width: size.width * 0.13,
          height: size.width * 0.13,
        ),
      ),
    );
  }
}
