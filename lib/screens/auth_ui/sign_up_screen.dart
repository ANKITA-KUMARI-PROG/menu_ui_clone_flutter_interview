import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:shope_ab/screens/auth_ui/verification_screen.dart';

import 'package:shope_ab/utils/app_constant.dart';

import 'sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          backgroundColor: AppConstant.appBackgroundColor,
          appBar: AppBar(
            backgroundColor: AppConstant.appBackgroundColor,
            title: Text(
              AppConstant.signUpText,
              style: AppConstant.textStyleSignUp,
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.02),
                
                // Subtitle
                Text(
                  AppConstant.createAccountText,
                  style: AppConstant.textStyleSubtitle,
                ),
                SizedBox(height: size.height * 0.03),

                // Name field
                _buildTextField(
                  hint: AppConstant.nameHint,
                  icon: Icons.person_outline,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: size.height * 0.02),

                // Email field
                _buildTextField(
                  hint: AppConstant.emailHint,
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: size.height * 0.02),

                // Phone field
                _buildTextField(
                  hint: AppConstant.phoneHint,
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: size.height * 0.02),

                // Date of birth field
                _buildTextField(
                  hint: AppConstant.dobHint,
                  icon: Icons.calendar_today_outlined,
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: size.height * 0.02),

                // Password field
                TextFormField(
                  cursorColor: AppConstant.appPrimaryColor,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                      horizontal: 15,
                    ),
                    hintText: AppConstant.passwordHint,
                    hintStyle: AppConstant.textStyleHint,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: size.height * 0.03,
                      color: AppConstant.appIconColor,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      child: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: size.height * 0.03,
                        color: AppConstant.appIconColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppConstant.appBorderColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppConstant.appPrimaryColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                // Confirm password field
                TextFormField(
                  cursorColor: AppConstant.appPrimaryColor,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                      horizontal: 15,
                    ),
                    hintText: AppConstant.confirmPasswordHint,
                    hintStyle: AppConstant.textStyleHint,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: size.height * 0.03,
                      color: AppConstant.appIconColor,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                      child: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: size.height * 0.03,
                        color: AppConstant.appIconColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppConstant.appBorderColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppConstant.appPrimaryColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                // Terms and conditions
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _termsAccepted = value ?? false;
                        });
                      },
                      activeColor: AppConstant.appPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: AppConstant.textStyleNormal,
                          children: [
                            TextSpan(text: AppConstant.termsPart1),
                            TextSpan(
                              text: AppConstant.termsPart2,
                              style: AppConstant.textStyleLink,
                            ),
                            TextSpan(text: AppConstant.termsPart3),
                            TextSpan(
                              text: AppConstant.termsPart4,
                              style: AppConstant.textStyleLink,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),

                // Sign up button
                SizedBox(
                  width: double.infinity,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(() =>  VerificationScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstant.appPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      AppConstant.signUpText,
                      style: AppConstant.textStyleButton,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),

                // Already a member
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppConstant.alreadyHaveAccount,
                      style: AppConstant.textStyleNormal,
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => Get.offAll(() => const SignInScreen()),
                      child: Text(
                        AppConstant.signInText,
                        style: AppConstant.textStyleLink,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.04),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    required TextInputType keyboardType,
  }) {
    final size = MediaQuery.of(context).size;
    return TextFormField(
      cursorColor: AppConstant.appPrimaryColor,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: size.height * 0.02,
          horizontal: 15,
        ),
        hintText: hint,
        hintStyle: AppConstant.textStyleHint,
        prefixIcon: Icon(
          icon,
          size: size.height * 0.03,
          color: AppConstant.appIconColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppConstant.appBorderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppConstant.appPrimaryColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}