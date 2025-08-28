import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shope_ab/screens/auth_ui/dashboard_screen.dart';
import 'package:shope_ab/screens/auth_ui/search_screen.dart';
import 'package:shope_ab/utils/app_constant.dart';

class CoffeeDetailScreen extends StatelessWidget {
  const CoffeeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.offAll(() =>  DashboardScreen()
              ),
            ),
            title: Text(
              "Details",
              style: AppConstant.textStyleTitle.copyWith(
                fontSize: size.height * 0.022,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),

          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isKeyboardVisible) ...[
                  /// IMAGE BANNER (hide only when keyboard visible)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/cafe1.png",
                      width: double.infinity,
                      height: size.height * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                ],

                /// TITLE + MENU LINK
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Track 5 Coffee",
                      style: AppConstant.textStyleTitle.copyWith(
                        fontSize: size.height * 0.022,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => SearchScreen(),
                      
                        );
                      },
                      child: Text(
                        "Check Menu",
                        style: AppConstant.textStyleNormal.copyWith(
                          fontSize: size.height * 0.016,
                          fontWeight: FontWeight.w500,
                          color: AppConstant.appPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Opens 7AM–8PM",
                  style: AppConstant.textStyleNormal.copyWith(
                    fontSize: size.height * 0.016,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                /// ABOUT
                Text(
                  "ABOUT",
                  style: AppConstant.textStyleBold.copyWith(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Text.rich(
                  TextSpan(
                    text:
                        "New Jersey’s unofficial cup of coffee might be a simple mug of joe from a diner ",
                    style: AppConstant.textStyleNormal.copyWith(
                      fontSize: size.height * 0.015,
                    ),
                    children: [
                      TextSpan(
                        text: "Read More",
                        style: TextStyle(
                          color: AppConstant.appPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                /// RATED BY SECTION
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRatedUser(size, name: "Karen Roe", rating: "4.8"),
                    Text(
                      "See All",
                      style: AppConstant.textStyleNormal.copyWith(
                        fontSize: size.height * 0.015,
                        color: AppConstant.appPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),

                /// GOOGLE REVIEWS
                _buildRatedUser(
                  size,
                  name: "Joshua Miller",
                  rating: "3.9",
                  isGoogle: true,
                ),
                SizedBox(height: size.height * 0.02),

                Divider(color: Colors.grey.shade300),

                /// WRITE REVIEW
                Text(
                  "WRITE A REVIEW",
                  style: AppConstant.textStyleBold.copyWith(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: size.height * 0.008),
                Text(
                  "Alright, Frequenters, time to drop some wisdom!",
                  style: AppConstant.textStyleNormal.copyWith(
                    fontSize: size.height * 0.014,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: size.height * 0.015),

                /// RATING STARS
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: size.height * 0.035,
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    debugPrint("User Rating: $rating");
                  },
                ),
                SizedBox(height: size.height * 0.02),

                /// TEXT FIELD
                Container(
                  padding: EdgeInsets.all(size.width * 0.03),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    maxLines: 4,
                    maxLength: 120,
                    decoration: InputDecoration(
                      hintText: "Drop Your Hot Take ✍️",
                      border: InputBorder.none,
                      counterText: "",
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "0/120 characters used",
                    style: AppConstant.textStyleNormal.copyWith(
                      fontSize: size.height * 0.012,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                /// SUBMIT BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstant.appPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.018,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Submit",
                      style: AppConstant.textStyleBold.copyWith(
                        fontSize: size.height * 0.018,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
              ],
            ),
          ),
        );
      },
    );
  }

  /// WIDGET FOR USER + RATING
  Widget _buildRatedUser(
    Size size, {
    required String name,
    required String rating,
    bool isGoogle = false,
  }) {
    return Row(
      children: [
        CircleAvatar(
          radius: size.height * 0.022,
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            Icons.person,
            size: size.height * 0.025,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: size.width * 0.02),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppConstant.textStyleNormal.copyWith(
                fontSize: size.height * 0.015,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: size.height * 0.018,
                ),
                SizedBox(width: size.width * 0.01),
                Text(
                  rating,
                  style: AppConstant.textStyleNormal.copyWith(
                    fontSize: size.height * 0.014,
                  ),
                ),
                if (isGoogle) ...[
                  SizedBox(width: size.width * 0.01),
                  Icon(
                    Icons.open_in_new,
                    size: size.height * 0.018,
                    color: AppConstant.appPrimaryColor,
                  ),
                ],
              ],
            ),
          ],
        ),
      ],
    );
  }
}
