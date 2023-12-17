// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unrelated_type_equality_checks, unused_import, unused_local_variable, unnecessary_null_comparison, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_assigned_app/models/User_Model.dart';
import 'package:task_assigned_app/services/Firebase_Auth.dart';
import 'package:task_assigned_app/utils/utils.dart';
import 'package:task_assigned_app/views/admin_login_view.dart';
import 'package:task_assigned_app/views/task_assigned_view.dart';
import 'package:task_assigned_app/views/user_otp_verification_view.dart';

import '../Helper/Method_Helper.dart';
import '../Helper/String_Helper.dart';
import '../main.dart';
import '../widegts/responsive_widgtes.dart';
import '../widegts/reuseable_elevated_button.dart';
import '../widegts/reuseable_textfield.dart';
import 'AdminPanel_view.dart';
import 'login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatpasswordController = TextEditingController();
  // ignore: unused_field
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DatabaseReference mDatabase = FirebaseDatabase.instance.ref();
  FirebaseAuth mAuth = FirebaseAuth.instance;
  bool _agreeToTerms = false;

  bool visible = true;
  bool confirmPassword = false;

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
            Column(
              children: [
                verticalPadding(height * 30 / height),
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
                        color: Color(0xFF182a48), // Change this color as needed
                      ),
                    ),
                  ],
                ),
                verticalPadding(height * 10 / height),
                SizedBox(
                  width: width * 320 / width,
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
                          'SIGN UP',
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
                  height: height / 50,
                ),
                ReuseableTextField(
                  Controller: nameController,
                  hintText: 'Name :',
                  icon: null,
                  obsecureText: false,
                ),
                SizedBox(
                  height: height*15/height,
                ),
                ReuseableTextField(
                  obsecureText: false,
                  Controller: cityController,
                  hintText: 'City :',
                  icon: null,
                ),
                SizedBox(
                  height: height / 60,
                ),
                ReuseableTextField(
                  obsecureText: false,
                  Controller: emailController,
                  hintText: 'Email :',
                  icon: null,
                ),
                SizedBox(
                  height: height / 60,
                ),
                ReuseableTextField(
                  obsecureText: false,
                  Controller: passwordController,
                  hintText: 'New Password :',
                  icon: null,
                ),
                SizedBox(
                  height: height / 60,
                ),
                ReuseableTextField(
                  obsecureText: false,
                  Controller: repeatpasswordController,
                  hintText: 'Re_enter Password :',
                  icon: null,
                ),
                SizedBox(
                  height: height / 150,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 20 / width),
                  child: Row(
                    children: <Widget>[
                      Transform.scale(
                        scaleX: height * 1.7 / height,
                        scaleY: height * 1.5 / height,
                        child: Checkbox(
                          activeColor: Color(0xFF182a48),
                          focusColor: Color(0xFF182a48),
                          hoverColor: Color(0xFF182a48),
                          side: BorderSide(width:  width*0.5/width,),
                          value: _agreeToTerms,
                          onChanged: (bool? value) {
                            print('${value}');
                            setState(() {
                              _agreeToTerms = value!;
                              // print('${_agreeToTerms}');
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: width * 260 / width,
                        child: Center(
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,

                            'I agree to the Terms of Service,Privacy Policy.Fund Policy',
                            // overflow: TextOverflow.v,
                            style: TextStyle(
                                fontSize: height * 14 / height,
                                color: Color(0xFF182a48),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                elevatedButton(() async {
                  if (nameController.text.isEmpty ||
                      cityController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      repeatpasswordController.text.isEmpty) {
                    Get.snackbar("Fill", "Fill all the fields");
                  } else {
                    progress(context);

                    AuthServices()
                        .signUp(emailController.text, passwordController.text)
                        .then((value) {
                      User_Model model = User_Model(
                          id: mAuth.currentUser!.uid.toString(),
                          name: nameController.text,
                          email: emailController.text,
                          city: cityController.text,
                          password: passwordController.text,
                          re_pass: repeatpasswordController.text,
                          time: get_time_miles().toString());
                      mDatabase
                          .child(user_table)
                          .child(model.id)
                          .set(model.toJson());

                      Get.snackbar("Successfully", "Login Successcully.");
                      Navigator.of(context).pop();
                      Get.off(TaskAssignedView());
                    });
                  }
                }, 'Sign up'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class TrapeziumPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = Colors.red;

//     final path = Path()
//       ..moveTo(0, 0)
//       ..lineTo(size.width, 0)
//       ..lineTo(size.width * 0.8, size.height)
//       ..lineTo(size.width * 0.2, size.height)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

customText(text, fontSize, fontweight) {
  return Text(text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontweight,
          color: Color(0xFF182a48)));
}
