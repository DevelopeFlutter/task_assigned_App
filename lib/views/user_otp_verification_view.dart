// ignore_for_file: prefer_const_constructors, unnecessary_this

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_assigned_app/Helper/String_Helper.dart';
import 'package:task_assigned_app/main.dart';
import 'package:task_assigned_app/models/User_Model.dart';
import 'package:task_assigned_app/utils/utils.dart';

import 'package:task_assigned_app/views/task_assigned_view.dart';
import 'package:task_assigned_app/widegts/responsive_widgtes.dart';

import '../Helper/Method_Helper.dart';
import '../widegts/reuseable_textfield.dart';

class UserLogin extends StatefulWidget {
  final String name, dob, city;
  UserLogin({
    super.key,
    // required this.verivactionid,
    required this.name,
    required this.dob,
    required this.city,
    // required this.password,
    // required this.num
  });

  @override
  State<UserLogin> createState() =>
      _UserLoginState(this.name, this.dob, this.city);
}

TextEditingController numberController = TextEditingController();
TextEditingController otpController = TextEditingController();

class _UserLoginState extends State<UserLogin> {
  // String verivactionid;
  String name, dob, city;
  // password, num;
  _UserLoginState(
    this.name,
    this.dob,
    this.city,
  );

  FirebaseAuth mAuth = FirebaseAuth.instance;
  DatabaseReference mDatabase = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
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
            Column(children: [
              verticalPadding(height / 30),
              Align(
                alignment: Alignment.center,
                child: RichText(
                    text: TextSpan(
                  style: TextStyle(decoration: TextDecoration.underline),
                  children: [
                    CustomeTextSpan('Earn', height / 20, FontWeight.bold),
                    CustomeTextSpan('With', height / 50, FontWeight.bold),
                    CustomeTextSpan('Write', height / 40, FontWeight.bold),
                    CustomeTextSpan(
                      'Assignments',
                      height / 30,
                      FontWeight.bold,
                    ),
                  ],
                )),
              ),
              verticalPadding(height / 30),
              Text(
                'OTP VERIFICATION',
                style: TextStyle(
                    fontSize: height / 30,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500),
              ),
              verticalPadding(height / 30),
              adminLoginCustomTextField('Enter OTP', otpController),
              verticalPadding(height / 50),
              customeButton(
                'login',
                () async {
                  if (otpController.text.isEmpty) {
                    Get.snackbar("Error", "Fill all the fields");
                  } else {
                    progress(context);
                    // Create a PhoneAuthCredential with the code
                    // PhoneAuthCredential credential =
                    //     PhoneAuthProvider.credential(
                    //         verificationId: verivactionid,
                    //         smsCode: otpController.text);

                    // // Sign the user in (or link) with the credential
                    // await mAuth.signInWithCredential(credential).then((value) {
                    //   User_Model model = User_Model(
                    //       id: mAuth.currentUser!.uid.toString(),
                    //       name: name,
                    //       // number: num,
                    //       dob: dob,
                    //       city: city,
                    //       // password: password,
                    //       // re_pass: password,
                    //       time: get_time_miles().toString(),
                    //       balance: "0");
                    //   print('${model.name} this is the model');

                    //   mDatabase
                    //       .child(user_table)
                    //       .child(model.id)
                    //       .set(model.toJson());

                    //   Get.snackbar("Successfully", "Login Successcully.");
                    //   Navigator.of(context).pop();
                    //   Get.off(TaskAssignedView());
                    // }).onError((error, stackTrace) {
                    //   Get.snackbar("Error", "$error");
                    //   Navigator.of(context).pop();
                    // });
//  User_Model model = User_Model(
//                           id: mAuth.currentUser!.uid.toString(),
//                           name: name,
//                           // number: num,
//                           dob: dob,
//                           city: city,
//                           // password: password,
//                           // re_pass: password,
//                           time: get_time_miles().toString(),
//                           // balance: "0"

//                           );
//                       print('${model.name} this is the model');

//                       mDatabase
//                           .child(user_table)
//                           .child(model.id)
//                           .set(model.toJson());

//                       Get.snackbar("Successfully", "Login Successcully.");
//                       Navigator.of(context).pop();
                  }

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => TaskAssignedView()),
                  // );
                },
                Color.fromRGBO(255, 248, 225, 1),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

adminLoginCustomTextField(hintText, controller) {
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width*25/width),
        color: const Color.fromRGBO(255, 248, 225, 1),
      ),
      width: width * 0.85,
      height: height / 18,
      child: TextFormField(
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
            // prefixIcon: Image.asset(
            //   'assets/images/share.png',
            //   scale: height / 200,
            // ),

            contentPadding: EdgeInsets.symmetric(
                vertical: height / 80, horizontal: width * 0.06),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width*25/width),
              borderSide: BorderSide(
                width: 1.5,
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
