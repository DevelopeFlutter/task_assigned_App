// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, use_build_context_synchronously, unnecessary_null_comparison, avoid_print, unnecessary_string_interpolations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_assigned_app/Helper/String_Helper.dart';
import 'package:task_assigned_app/main.dart';
import 'package:task_assigned_app/models/Admin_Model.dart';
import 'package:task_assigned_app/services/Firebase_Auth.dart';
import 'package:task_assigned_app/views/AdminPanel_view.dart';
import 'package:task_assigned_app/widegts/responsive_widgtes.dart';

import '../Helper/Method_Helper.dart';
import '../utils/utils.dart';
import '../widegts/reuseable_elevated_button.dart';
import '../widegts/reuseable_textfield.dart';
import 'task_assigned_view.dart';
import 'user_otp_verification_view.dart';


adminLoginCustomTextField(hintText, controller) {
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: const Color.fromRGBO(255, 248, 225, 1),
      ),
      width: width * 0.85,
      height: height / 18,
      child: TextFormField(
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: height / 80, horizontal: width * 0.06),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width*25/width),
              borderSide: BorderSide(
                width: width*1.5/width,
                color: Colors.black,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width*25/width),
              borderSide: BorderSide(
                width: width*1.5/width,
                color: Colors.black,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.black,
                fontSize: height / 40,
                fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width*25/width),
            )),
        onChanged: (value) {},
      ));
}

customeButton(text, onpress, color) {
  return SizedBox(
    height: height / 17,
    width: width * 0.5,
    child: ElevatedButton(
      onPressed: onpress,
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: height*22/height),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width*25/width),
          ))),
    ),
  );
}

class AdminloginScreen extends StatefulWidget {
  const AdminloginScreen({super.key});
  @override
  State<AdminloginScreen> createState() => _AdminloginScreenState();
}

class _AdminloginScreenState extends State<AdminloginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DatabaseReference mDatabase = FirebaseDatabase.instance.ref();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _agreeToTerms = false;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                SizedBox(
                  height: height / 20,
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
                          'Admin Login',
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
                  height: 15,
                ),
                ReuseableTextField(
                  obsecureText: false,
                  Controller: passwordController,
                  hintText: 'Password :',
                  icon: null,
                ),
                SizedBox(
                  height: height / 8,
                ),
                elevatedButton(() async {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    Get.snackbar("Fill", "Fill all the fields");
                  } else {
                    // progress(context);
                    signIn(emailController.text, passwordController.text);
                  }
                }, 'Login'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential != null) {
        // Admin_Model model = Admin_Model(
        //   id: auth.currentUser!.uid.toString(),
        //   name: 'Shahzaib',
        //   password: passwordController.text,
        //   email: emailController.text,
        //   // time: get_time_miles().toString()
        // );
        // mDatabase.child(admin_table).child(model.id).set(model.toJson());
        Get.snackbar("Successfully", "Login Successfully.");
        // Navigator.of(context).pop(); 
        Get.to(AdminPanelScreen());
      }

      return userCredential;
    } catch (e) {
      print('Error is called');
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          Get.snackbar("Error", "The password provided is too weak");
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar("Error", "The account already exists for that email.");
        }
      }
      Get.snackbar('Error message', '${e.toString()}');
      print(e.toString());
      return null;
    }
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
