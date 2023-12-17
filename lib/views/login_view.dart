// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unrelated_type_equality_checks, unused_import, unused_local_variable, non_constant_identifier_names

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_assigned_app/Helper/Method_Helper.dart';
import 'package:task_assigned_app/Helper/String_Helper.dart';
import 'package:task_assigned_app/models/User_Model.dart';
import 'package:task_assigned_app/services/Firebase_Auth.dart';
import 'package:task_assigned_app/utils/utils.dart';
// import 'package:task_assigned_app/views/pdf_view.dart';
import 'package:task_assigned_app/views/task_assigned_view.dart';

import '../main.dart';
import '../widegts/responsive_widgtes.dart';
import '../widegts/reuseable_elevated_button.dart';
import '../widegts/reuseable_textfield.dart';
import 'login_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordlController = TextEditingController();
  TextEditingController otp = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool visible = true;
  bool confirmPassword = false;

  FirebaseAuth mAuth = FirebaseAuth.instance;
  DatabaseReference mDatabase = FirebaseDatabase.instance.ref();
  List<User_Model> allusers = [];

  String veri_id = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetch_users();
  }

  void visibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/bg.png'), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                )),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height / 16,
                  ),
                  Image.asset(
                    'assets/images/splash.jpg',
                    height: height * 80 / height,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        // color: Colors.blue,
                        height: height / 18,
                        width: width * 320 / width,
                        child: RichText(
                            text: TextSpan(
                          // style: TextStyle(decoration: TextDecoration.underline),
                          children: [
                            CustomeTextSpan(
                                'Earn', height * 42 / height, FontWeight.bold),
                            CustomeTextSpan(
                                'With', height * 18 / height, FontWeight.bold),
                            CustomeTextSpan(
                                'Write', height * 22 / height, FontWeight.bold),
                            CustomeTextSpan(
                              'Assignment',
                              height / 30,
                              FontWeight.bold,
                            ),
                          ],
                        )),
                      ),
                      SizedBox(
                        width: width * 320 / width,
                        child: Container(
                          height: height*2.5/height,
                          color:
                              Color(0xFF182a48), // Change this color as needed
                        ),
                      ),
                    ],
                  ),
                  verticalPadding(height * 20 / height),

                  SizedBox(
                    width: width * 280 / width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/carton.png',
                          height: height / 8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 50 / height),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: height / 25,
                              color: Color(0xFF182a48),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationThickness: height*1.5/height,
                              decorationColor: Color(0xFF182a48),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: height / 8,
                            child: Image.asset('assets/images/cartonri.png')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  ReuseableTextField(
                    Controller: emailController,
                    hintText: 'Email :',
                    icon: null,
                    obsecureText: false,
                  ),


                  SizedBox(
                    height: height / 40,
                  ),
                  ReuseableTextField(
                    obsecureText: false,
                    Controller: passwordlController,
                    hintText: 'Password :',
                    icon: null,
                  ),

                  SizedBox(
                    height: height / 10,
                  ),
                  elevatedButton(() async {
                    if (emailController.text.isEmpty ||
                        passwordlController.text.isEmpty) {
                      Get.snackbar("Error", "Fill all the fields");
                    } else {
                      AuthServices().signIn(
                          emailController.text, passwordlController.text);
                    }
                  }, 'Login'),

                  // const SizedBox(height: 50,),

                  // ReuseableTextField(
                  //   obsecureText: false,
                  //   Controller: otp,
                  //   hintText: 'OTP Code :',
                  //   icon: null,

                  // ),
                  // const SizedBox(height: 10,),
                  // elevatedButton(() async {
                  //   if(otp.text.isEmpty)
                  //     {
                  //       Get.snackbar("Error", "Fill otp field.");
                  //     }
                  //   else{

                  //     EasyLoading.show();
                  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: veri_id, smsCode: otp.text);
                  //     await mAuth.signInWithCredential(credential).then((value) {
                  //       EasyLoading.dismiss();
                  //       EasyLoading.showSuccess("Successfully login");
                  //       Get.off(TaskAssignedView());
                  //     }).onError((error, stackTrace) {
                  //       Get.snackbar("Error", "$error");
                  //       EasyLoading.dismiss();
                  //     });
                  //   }

                  // }, 'Verify'),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: RichText(
                  //     text: TextSpan(
                  //       text: 'Already Account',
                  //       style: TextStyle(fontSize: 15, color: Colors.white),
                  //       children: <TextSpan>[
                  //         TextSpan(
                  //             recognizer: TapGestureRecognizer()
                  //               ..onTap = () {
                  //                 Navigator.push(
                  //                   context,
                  //                   MaterialPageRoute(
                  //                       builder: (context) => LoginView()),
                  //                 );
                  //               },
                  //             text: 'Button',
                  //             style:
                  //                 TextStyle(fontSize: 15, color: Colors.green)),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void fetch_users() {
    mDatabase.child(user_table).onValue.listen((event) {
      Map<dynamic, dynamic> map = event.snapshot.value as Map;

      map.forEach((key, value) {
        allusers.add(User_Model.fromJson(value));
        print('$value This is the value');
      });

      setState(() {});
    });
  }

  void checkuser(String email, String pass) async {
    bool notexist = false;
    for (int i = 0; i < allusers.length; i++) {
      if (allusers[i].email == email) {
        if (allusers[i].password == pass) {
          EasyLoading.show();
          FirebaseAuth auth = FirebaseAuth.instance;

          await auth.verifyPhoneNumber(
            phoneNumber: emailController.text,
            codeSent: (String verificationId, int? resendToken) async {
              Get.snackbar("Successfully", "Code Send Successfully");

              EasyLoading.dismiss();
              veri_id = verificationId;
              setState(() {});
            },
            verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
              print("complete manan");
            },
            verificationFailed: (FirebaseAuthException error) {
              Get.snackbar("Error", "$error");
              EasyLoading.dismiss();
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
          );

          notexist = false;
        } else {
          Get.snackbar("Error", "Wrong password");
          notexist = false;
          break;
        }
      } else {
        notexist = true;
      }
    }
    if (notexist == true) {
      Get.snackbar("Error", "Number not exist");
    }
  }
}
