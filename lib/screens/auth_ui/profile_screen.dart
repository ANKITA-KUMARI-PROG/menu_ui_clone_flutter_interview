import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_ab/screens/auth_ui/sign_in.dart';
import 'package:shope_ab/utils/app_constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.offAll(() => SignInScreen())),
        title: Text(
          "Profile Settings",
          style: AppConstant.textStyleTitle.copyWith(
            fontSize: size.height * 0.022,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Profile Avatar + Info
            SizedBox(height: size.height * 0.02),
            Stack(
              children: [
                CircleAvatar(
                  radius: size.width * 0.15,
                  backgroundImage: const AssetImage("assets/images/logo.png"),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: CircleAvatar(
                    radius: size.width * 0.045,
                    backgroundColor: AppConstant.appPrimaryColor,
                    child: const Icon(Icons.camera_alt,
                        color: Colors.white, size: 18),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.015),
            Text(
              "Albert Stevano Baptist",
              style: AppConstant.textStyleTitle.copyWith(
                fontSize: size.height * 0.02,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "AlbertStevano@gmail.com",
              style: AppConstant.textStyleNormal.copyWith(
                fontSize: size.height * 0.016,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: size.height * 0.025),

            /// Reward Points
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reward Point",
                  style: AppConstant.textStyleTitle.copyWith(
                    fontSize: size.height * 0.018,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: TextStyle(
                        color: AppConstant.appPrimaryColor,
                        fontSize: size.height * 0.016),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "This Home 8:4 Pass",
                style: AppConstant.textStyleNormal.copyWith(
                  fontSize: size.height * 0.016,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.015),

            /// Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard(size, "Check-Ins", "38"),
                _buildStatCard(size, "Businesses", "12"),
              ],
            ),
            SizedBox(height: size.height * 0.025),

            /// Profile Options
            _buildMenuItem(size, Icons.person_outline, "Personal Data", () {}),
            _buildMenuItem(size, Icons.settings_outlined, "Settings", () {}),
            _buildMenuItem(size, Icons.message_outlined, "Messages", () {}),
            _buildMenuItem(
                size, Icons.group_add_outlined, "Refer a Friend", () {}),
            _buildMenuItem(size, Icons.qr_code_scanner_outlined,
                "Scan QR Code", () {}),

            SizedBox(height: size.height * 0.02),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Support",
                  style: AppConstant.textStyleBold.copyWith(
                    fontSize: size.height * 0.018,
                    color: Colors.grey,
                  )),
            ),
            _buildMenuItem(size, Icons.help_outline, "Help Center", () {}),
            _buildMenuItem(size, Icons.lock_outline, "Privacy and Security",
                () {}),

            SizedBox(height: size.height * 0.04),

            /// Sign Out Button
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton.icon(
                onPressed: () {
                  // Add sign out logic here
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: Text(
                  "Sign Out",
                  style: TextStyle(
                      color: Colors.red, fontSize: size.height * 0.018),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  /// Profile Menu Items
  Widget _buildMenuItem(
      Size size, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.black, size: size.height * 0.025),
      title: Text(
        title,
        style: AppConstant.textStyleNormal.copyWith(
          fontSize: size.height * 0.017,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios,
          size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  /// Stat Card Widget
  Widget _buildStatCard(Size size, String title, String value) {
    return Container(
      width: size.width * 0.38,
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02, horizontal: size.width * 0.04),
      decoration: BoxDecoration(
        color: AppConstant.appCardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          Icon(Icons.verified, color: AppConstant.appPrimaryColor,
              size: size.height * 0.03),
          SizedBox(height: size.height * 0.008),
          Text(
            value,
            style: AppConstant.textStyleTitle.copyWith(
              fontSize: size.height * 0.02,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            title,
            style: AppConstant.textStyleNormal.copyWith(
              fontSize: size.height * 0.015,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}