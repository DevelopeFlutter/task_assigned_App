// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_assigned_app/views/login_view.dart';
import 'package:task_assigned_app/views/signUp_view.dart';
import 'package:task_assigned_app/widegts/responsive_widgtes.dart';
import 'package:task_assigned_app/widegts/reuseable_elevated_button.dart';

import '../main.dart';
import '../widegts/reuseable_textfield.dart';
import 'admin_login_view.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({super.key});

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Loginbg.png'),
                      fit: BoxFit.cover)),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: width * 0.07, top: height * 10 / height),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(AdminloginScreen());
                      },
                      child: Image.asset(
                        'assets/images/admin.png',
                        height: height * 30 / height,
                        color: Color(0xFF182a48),
                      ),
                    ),
                  ),
                ),
                // verticalPadding(height * 10 / height),
                Image.asset(
                  'assets/images/splash.jpg',
                  height: height * 110 / height,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                      text: TextSpan(
                    style: TextStyle(decoration: TextDecoration.underline),
                    children: [
                      CustomeTextSpan(
                          'Earn', height * 42 / height, FontWeight.bold),
                      CustomeTextSpan(
                          'With', height * 22 / height, FontWeight.bold),
                      CustomeTextSpan(
                          'Write', height * 22 / height, FontWeight.bold),
                      CustomeTextSpan(
                        'Assignments',
                        height / 30,
                        FontWeight.bold,
                      ),
                    ],
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 15 / width, top: height * 30 / height),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      reUseAssetsImage('assets/images/layer.png',
                          height * 150 / height, width * 140 / width),
                      Padding(
                          padding: EdgeInsets.only(
                            left: width * 5 / width,
                          ),
                          child: reUseAssetsImage('assets/images/arrowpic.png',
                              height * 70 / height, width * 90 / width)),
                      reUseAssetsImage('assets/images/carton.png',
                          height * 180 / height, width * 110 / width)
                    ],
                  ),
                ),
                verticalPadding(height * 110 / height),
                LoginSignuplEvatedButton(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginView();
                  }));
                }, 'LOGIN.......!'),
                verticalPadding(height * 20 / height),
                LoginSignuplEvatedButton(() {
                  Get.to(SignUpView());
                }, 'SIGN UP.......!')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

reUseAssetsImage(image, height, width) {
  return Image.asset(
    image,
    height: height,
    width: width,
  );
}
