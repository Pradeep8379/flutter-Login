import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/auth_controller.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Column(
      children: [
        Container(
            width: w,
            height: h * 0.3,
            color: Colors.black,
            child: Center(
              child: Text('Become a part of our community!',
                  style: TextStyle(fontSize: 30.0, color: Colors.white)),
            )),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          width: w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up Here',
                style: TextStyle(fontSize: 35, color: Colors.black),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Enter Email',
                  style: TextStyle(color: Colors.blue, fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Enter Password',
                  style: TextStyle(color: Colors.blue, fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: ElevatedButton(
            onPressed: () {
              AuthController.instance.register(emailController.text.trim(),passwordController.text.trim());
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: Text('Sign Up',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ),
        SizedBox(height:10,),
        RichText(
            text: TextSpan(
              recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                text: 'Have an account?',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                )
            )
        )
      ],
    ));
  }
}
