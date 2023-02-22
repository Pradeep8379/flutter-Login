import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/login_page.dart';
import 'package:login_app/welcome_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    auth.currentUser;
    _user = auth.currentUser as Rx<User?>;
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    print(user);
    print(User);
    if (user == null) {
      print('login page');
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage());
    }
  }

  void register(String email, password) async {
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      if (user != null) {
        Get.offAll(() => LoginPage());
      }
    } catch (e) {
      Get.snackbar('About user', "User message",
          backgroundColor: Colors.blue,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            'Account creation failed',
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void signIn(String email, password) async {
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      if (user != null) {
        Get.offAll(() => WelcomePage());
      }
    } catch (e) {
      Get.snackbar('About user', "User message",
          backgroundColor: Colors.blue,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            'Failed to login!',
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void logOut() async {
    await auth.signOut();
    Get.offAll(() => LoginPage());
  }
}
