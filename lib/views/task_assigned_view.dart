// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unrelated_type_equality_checks, unused_import, unused_local_variable, sort_child_properties_last, non_constant_identifier_names, equal_keys_in_map

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:task_assigned_app/Chat/User_chat.dart';
import 'package:task_assigned_app/models/Add_Pakage_Model.dart';
import 'package:task_assigned_app/models/Admin_Model.dart';
import 'package:task_assigned_app/models/User_Model.dart';
import 'package:task_assigned_app/views/signUp_view.dart';
import '../Helper/Method_Helper.dart';
import '../Helper/String_Helper.dart';
import '../main.dart';
import '../models/Chat_room_model.dart';
import '../widegts/responsive_widgtes.dart';
import '../widegts/reuseable_elevated_button.dart';
import '../widegts/reuseable_textfield.dart';

import 'login_view.dart';

class TaskAssignedView extends StatefulWidget {
  const TaskAssignedView({super.key});
  @override
  State<TaskAssignedView> createState() => _TaskAssignedViewState();
}

class _TaskAssignedViewState extends State<TaskAssignedView> {
  List<Add_Pakage_Model> allpakages = [];
  DatabaseReference mDatabase = FirebaseDatabase.instance.ref();
  Admin_Model? admin_model;

  @override
  void initState() {
    super.initState();
    loadpakages();
  }

  var packagenames = [
    "First Test",
    "Second Test",
    "Copper",
    "Silver",
    "Gold",
    "Titanium",
    "Platinum",
    "Diamond",
  ];

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
                        'assets/images/taskassign.png'), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                left: width * 10 / width,
                top: height * 15 / height,
                right: width * 10 / width,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Icon(Icons.person),
                            height: height * 50 / height,
                            width: width * 50 / width,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 6 / width),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                CustomText('User name', height * 15.0 / height,
                                    FontWeight.bold),
                                CustomText('CR#105', height * 15 / height,
                                    FontWeight.bold),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   textBaseline: TextBaseline.ideographic,
                      //   children: [
                      //     Row(children: [
                      //       Padding(
                      //         padding: EdgeInsets.only(
                      //             right: width * 5 / width,
                      //             bottom: height * 8 / height),
                      //         child: Image.asset(
                      //           'assets/images/alarm.png',
                      //           height: height * 20 / height,
                      //         ),
                      //       ),
                      //       underlineCustomText('06:55', height * 15.0 / height,
                      //           FontWeight.bold),
                      //     ]),
                      //     underlineCustomText('Moday 18-12-23',
                      //         height * 15 / height, FontWeight.bold),
                      //   ],
                      // ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: width * 7 / width),
                    child: Row(
                      children: [
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Balance',
                                style: TextStyle(
                                    fontSize: height * 20 / height,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w700)),
                            TextSpan(
                                text: ' : ',
                                style: TextStyle(
                                    fontSize: height * 20 / height,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                            TextSpan(
                                text: '0 pkr',
                                style: TextStyle(
                                    fontSize: height * 30 / height,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                          ],
                        )),
                      ],
                    ),
                  ),
                  verticalPadding(height * 10 / height),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customPaymentContainer(
                          'Cash Desposite', 'assets/images/deposite.png'),
                      horizontalPadding(width * 20 / width),
                      customPaymentContainer(
                          'Cash Withdraw', 'assets/images/withdraw.png')
                    ],
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 15 / width, right: width * 15 / width),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/carton.png',
                          height: height / 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 12 / height),
                          child: Container(
                            width: width * 0.55, // Adjust the width as needed
                            height: height / 16, // Adjust the height as needed
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(width * 10 / width),
                              color: Color(0xFF182a48),
                            ),
                            child: Center(
                              child: Text(
                                'Select the Package',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 17 / height,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: height / 10,
                            child: Image.asset('assets/images/cartonri.png')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 70,
                  ),
                  SizedBox(
                    height: height / 2.5,
                    child: ResponsivePadding(
                      leftPadding: 0.03,
                      rightPadding: 0.03,
                      topPadding: 0.015,
                      bottomPadding: 0,
                      child: allpakages.isEmpty
                          ? Center(
                              child: CircularProgressIndicator(
                              color: Color(0xFF182a48),
                            ))
                          : GridView.builder(
                              itemCount: allpakages.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: width * 20 / width,
                                      crossAxisSpacing: height * 10 / height,
                                      childAspectRatio: height * 3 / height),
                              itemBuilder: (BuildContext context, int index) {
                                dynamic packageNames = packagenames[index];

                                return GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Stack(
                                            children: [
                                              Dialog(
                                                insetPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal:
                                                            width * 15 / width,
                                                        vertical: height *
                                                            10 /
                                                            height),
                                                backgroundColor:
                                                    const Color.fromRGBO(
                                                        14, 14, 14, 14),
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    width: width * 2 / width,
                                                    color: Color.fromARGB(
                                                        255, 250, 234, 180),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width * 30 / width),
                                                ),
                                                child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: height / 1.3,
                                                  child: Column(
                                                    children: <Widget>[
                                                      verticalPadding(
                                                          height / 30),
                                                      RichText(
                                                        text: TextSpan(
                                                            text: '',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                            children: [
                                                              TextSpan(
                                                                  text: allpakages[
                                                                          index]
                                                                      .package_no,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        height /
                                                                            40,
                                                                  )),
                                                              TextSpan(
                                                                  text: ' (',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        height /
                                                                            40,
                                                                  )),
                                                              TextSpan(
                                                                  text: allpakages[
                                                                          index]
                                                                      .pakage_name,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .green,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        height /
                                                                            40,
                                                                  )),
                                                              TextSpan(
                                                                  text: ')',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        height /
                                                                            40,
                                                                  ))
                                                            ]),
                                                      ),
                                                      customDivider(),
                                                      SizedBox(
                                                          width: width * 0.75,
                                                          child: custTextwithStyle(
                                                              text: allpakages[
                                                                      index]
                                                                  .te1,
                                                              color:
                                                                  Colors.white,
                                                              fontweight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontsize:
                                                                  height / 45)),
                                                      // verticalPadding(height / 200),
                                                      customDivider(),

                                                      SizedBox(
                                                          width: width * 0.75,
                                                          child: custTextwithStyle(
                                                              text: allpakages[
                                                                      index]
                                                                  .te2,
                                                              color:
                                                                  Colors.white,
                                                              fontweight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontsize:
                                                                  height / 45)),
                                                      // verticalPadding(
                                                      //     height / 300),

                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: height *
                                                                      30 /
                                                                      height),
                                                          child: elevatedButton(
                                                            () async {
                                                              EasyLoading
                                                                  .show();
                                                              String s =
                                                                  my_id();
                                                              print(s);
                                                              mDatabase
                                                                  .child(
                                                                      user_table)
                                                                  .child(s)
                                                                  .once()
                                                                  .then(
                                                                      (value) {
                                                                EasyLoading
                                                                    .dismiss();
                                                                if (value
                                                                    .snapshot
                                                                    .exists) {
                                                                  User_Model
                                                                      user =
                                                                      User_Model.fromJson(value
                                                                          .snapshot
                                                                          .value as Map);

                                                                  Chat_room_model chatRoom = Chat_room_model(
                                                                      id: s,
                                                                      sender_id:
                                                                          s,
                                                                      time:
                                                                          get_time_miles(),
                                                                      msg: '',
                                                                      user_model:
                                                                          user,
                                                                      admin_id:
                                                                          allpakages[index]
                                                                              .uid);

                                                                  nxt_page(User_chat(
                                                                      chat_room_model:
                                                                          chatRoom));
                                                                }
                                                              });
                                                            },
                                                            'Connect with Admin',
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: width * 0.80,
                                                top: height * 55 / height,
                                                // bottom: height / 10,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Image.asset(
                                                    'assets/images/cross.png',
                                                    height: height / 20,
                                                    width: width * 0.20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: customeContainer(
                                        index + 1,
                                        packageNames.toString(),
                                        allpakages[index].days));
                              }),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 10 / height),
                    child: elevatedButton(() async {}, 'Done'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void loadpakages() {
    mDatabase.child(pakages_table).onValue.listen((event) {
      Map<dynamic, dynamic> map = event.snapshot.value as Map;

      List<Add_Pakage_Model> packages = [];

      // Look for 'Package No 1' to 'Package No 8' and add them to 'packages' list
      for (int i = 1; i <= 8; i++) {
        String packageNoToFind = 'Package No $i';
        var packageData = map.values.firstWhere(
          (value) {
            String packageNo = value['package_no']?.trim() ?? '';
            return packageNo == packageNoToFind;
          },
          orElse: () => null,
        );
        if (packageData != null) {
          packages.add(Add_Pakage_Model.fromJson(packageData));
        }
      }

      // Sort 'packages' based on 'package_no' field (ascending order)
      packages.sort((a, b) {
        int packageNumberA = int.tryParse(a.package_no.split(' ').last) ?? 0;
        int packageNumberB = int.tryParse(b.package_no.split(' ').last) ?? 0;
        return packageNumberA.compareTo(packageNumberB);
      });

      setState(() {
        allpakages = packages;
      });
    });
  }
}

CustomText(text, fontsize, fontweight) {
  return Text(text,
      style: TextStyle(
          fontSize: fontsize, fontWeight: fontweight, color: Colors.white));
}

underlineCustomText(text, fontsize, fontweight) {
  return Text(text,
      style: TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: Colors.white,
          fontSize: fontsize,
          fontWeight: fontweight,
          color: Colors.white));
}

customPaymentContainer(text, image) {
  return Container(
    height: height * 30 / height,
    width: width * 140 / width,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.amberAccent),
        color: Color.fromARGB(255, 243, 237, 219),
        borderRadius: BorderRadius.circular(5)),
    child: Padding(
      padding: EdgeInsets.only(left: width * 10 / width),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            height: height * 22 / height,
          ),
          horizontalPadding(width * 5 / width),
          Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.w800, fontSize: height * 11 / height)),
        ],
      ),
    ),
  );
}
