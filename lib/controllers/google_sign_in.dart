// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shope_ab/modles/user_model.dart';
import 'package:shope_ab/screens/user_panel/main_screen.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // ignore: non_constant_identifier_names
  Future<void> SignInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn
          .signIn();

      if (googleSignInAccount != null) {
        EasyLoading.show(status: "pease wait ...");
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        // save data
        final UserCredential userCredential = await firebaseAuth
            .signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          UserModel userModel = UserModel(
            uId: user.uid.toString(),
            username: user.displayName.toString(),
            email: user.email.toString(),
            phone: user.phoneNumber.toString(),
            userImg: user.photoURL.toString(),
            userDeviceToken: '',
            country: '',
            userAddress: '',
            street: '',
            isAdmin: false,
            isActive: true,
            createdOn: DateTime.now(),
            city: '',
          );

          // collect data

          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set(userModel.toMap());
          EasyLoading.dismiss();

          Get.offAll(() => MainScreen());
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("error $e");
    }
  }
}
