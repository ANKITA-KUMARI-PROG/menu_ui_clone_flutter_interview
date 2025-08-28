// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:shope_ab/screens/auth_ui/sign_up_screen.dart';
import 'package:shope_ab/utils/app_constant.dart';

import 'sent_email_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final String _email = "lucasacott3@email.com";

  @override
  void initState() {
    super.initState();
    // Set up focus node listeners
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        if (!_focusNodes[i].hasFocus && _controllers[i].text.isEmpty) {
          // Move focus to previous field if current is empty and losing focus
          if (i > 0) {
            FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
          }
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
    setState(() {}); // refresh button enable state
  }

  bool _isCodeComplete() {
    return _controllers.every((controller) => controller.text.isNotEmpty);
  }

  void _resendCode() {
    // Implement resend code functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppConstant.codeResentMessage),
        backgroundColor: AppConstant.appSuccessColor,
      ),
    );
  }

  void _verifyCode() {
    if (_isCodeComplete()) {
      final code = _controllers.map((c) => c.text).join();

      // ignore: avoid_print
      print("Verifying code: $code");

      Get.offAll(() =>  SentEmailScreen(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppConstant.appBackgroundColor,
          appBar: AppBar(
            backgroundColor: AppConstant.appBackgroundColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppConstant.appTextColor,
                size: size.height * 0.025,
              ),
              onPressed: () => Get.offAll(() => SignUpScreen()
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: size.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.03),

                // Title
                Text(
                  AppConstant.verificationTitle,
                  style: AppConstant.textStyleTitle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.03),

                // Description
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppConstant.textStyleNormal.copyWith(
                      fontSize: size.height * 0.018,
                    ),
                    children: [
                      TextSpan(text: AppConstant.verificationDescription),
                      TextSpan(
                        text: _email,
                        style: AppConstant.textStyleBold.copyWith(
                          fontSize: size.height * 0.018,
                          color: AppConstant.appPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.05),

                // OTP Input Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: size.width * 0.15,
                      height: size.width * 0.15,
                      child: TextFormField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: TextStyle(
                          fontSize: size.height * 0.03,
                          fontWeight: FontWeight.bold,
                          color: AppConstant.appTextColor,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: isDarkMode
                              ? AppConstant.appCardColor
                              : AppConstant.appBackgroundColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppConstant.appBorderColor,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppConstant.appPrimaryColor,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppConstant.appBorderColor,
                              width: 1.5,
                            ),
                          ),
                        ),
                        onChanged: (value) => _onChanged(value, index),
                      ),
                    );
                  }),
                ),
                SizedBox(height: size.height * 0.04),

                // Resend Code
                TextButton(
                  onPressed: _resendCode,
                  child: Text(
                    AppConstant.resendCode,
                    style: AppConstant.textStyleLink.copyWith(
                      fontSize: size.height * 0.018,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                    onPressed: _isCodeComplete() ? _verifyCode : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isCodeComplete()
                          ? AppConstant.appPrimaryColor
                          : AppConstant.appPrimaryColor.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      AppConstant.continueText,
                      style: AppConstant.textStyleButton.copyWith(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),

                // Help Text
                Text(
                  AppConstant.verificationHelp,
                  style: AppConstant.textStyleNormal.copyWith(
                    fontSize: size.height * 0.014,
                    color: AppConstant.appTextColor.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
