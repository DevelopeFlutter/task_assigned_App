// ignore_for_file: unused_import, prefer_const_constructors, use_super_parameters

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_assigned_app/views/login_signup_Screen.dart';
import 'package:task_assigned_app/views/signUp_view.dart';
import 'package:task_assigned_app/views/task_assigned_view.dart';
import 'package:task_assigned_app/views/user_otp_verification_view.dart';
import 'package:task_assigned_app/widegts/responsive_widgtes.dart';

import 'views/admin_login_view.dart';
// import 'views/chat_page_view.dart';
import 'views/login_view.dart';

double height = 0.0;
double width = 0.0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Platform.isAndroid
  //     ? await Firebase.initializeApp(
  //         options: const FirebaseOptions(
  //           apiKey: "AIzaSyDuc2qhFYRkkn_q9j8CeBVxoUmGD7rujIU",
  //           appId: "1:821916646818:android:bab83e8753002a39e806fb",
  //           messagingSenderId: "821916646818",
  //           projectId: "taskassigner-bfe14",
  //         ),
  //       )
  //     :
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey),
      home:
          // LoginView(),
          //  ChatPage(),
          //  UserLogin(),
          // AdminloginScreen() ,
          // AdminLogin(),
          // TaskAssignedView(),

          // LoginSignUp(),
          SplashScreen(),
      builder: EasyLoading.init(),

      //  AdminLogin()
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoadingScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset(
        'assets/images/splash.jpg',
        height: height * 180 / height,
      )),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginSignUp(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Image.asset(
              'assets/images/splash.jpg',
              height: height * 180 / height,
            ),
          ),
          verticalPadding(height * 200 / height),
          Padding(
            padding: EdgeInsets.only(bottom: height * 80 / height),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: width * 31 / width),
                    child: Text(
                      'LOADING .........',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: height * 1.2 / height,
                          decorationColor: Color(0xFF182a48),
                          color: Color(0xFF182a48),
                          fontSize: height * 18 / height,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                verticalPadding(height * 3 / height),
                Container(
                  height: height * 35 / height,
                  width: width * 300 / width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF182a48),
                    ),
                    color: Colors.transparent,
                  ),
                  child: Row(children: [
                    horizontalPadding(width * 2 / width),
                    loadingScreenContainer(),
                    horizontalPadding(width * 2.5 / width),
                    loadingScreenContainer(),
                    horizontalPadding(width * 2.5 / width),
                    loadingScreenContainer()
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

loadingScreenContainer() {
  return Container(
      height: height * 35 / height,
      color: Color(0xFF182a48),
      width: width * 17 / width);
}
