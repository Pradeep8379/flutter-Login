import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/login_page.dart';
import 'package:login_app/welcome_page.dart';


class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    auth.currentUser;
    _user = auth.currentUser as Rx<User?>;
    _user.bindStream(auth.userChanges());
    ever(_user,_initialScreen);
  }

  _initialScreen(User? user){
    print(user);
    print(User);
    if(user==null){
      print('login page');
      Get.offAll(()=>LoginPage());
    }else{
      Get.offAll(()=>WelcomePage());
    }
  }

  void register(String email, password)async{
   try{
    await auth.createUserWithEmailAndPassword(email: email, password: password);
   }catch(e){
     Get.snackbar('About user', "User message",
     backgroundColor: Colors.blue,
     snackPosition: SnackPosition.BOTTOM,
       titleText: Text(
           'Account creation failed',
         style: TextStyle(
           color: Colors.white
         ),
       ),
       messageText: Text(
         e.toString(),
         style: TextStyle(
             color: Colors.white
         ),

       )
     );
   }
  }
}