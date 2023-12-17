// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_assigned_app/models/User_model.dart';

import 'String_Helper.dart';

get_time_miles() {
  return DateTime.now().millisecondsSinceEpoch;
}

nxt_page(var page) {
  Get.to(page,
      transition: Transition.rightToLeft,
      duration: Duration(milliseconds: 500));
}

off_curnt_go_nxt_page(var page) {
  Get.off(page,
      transition: Transition.rightToLeft, duration: Duration(seconds: 1));
}

off_all_go_nxt_page(var page) {
  Get.offAll(page,
      transition: Transition.rightToLeft, duration: Duration(seconds: 1));
}

my_id() {
  return FirebaseAuth.instance.currentUser?.uid.toString();
}

get_user(String id) async {
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  User_Model? model;

  await databaseReference.child(user_table).child(id).once().then((value) {
    if (value.snapshot.exists) {
      model = User_Model.fromJson(value.snapshot.value as Map);
    }
  });
  return model;
}

upload_img(File file) async {
  String img = '';

  var stirage =
      await FirebaseStorage.instance.ref().child(get_time_miles().toString());
  await stirage.putFile(file);
  img = await stirage.getDownloadURL();

  return img;
}

get_formated_time(String format, int milisnd) {
  return DateFormat(format)
      .format(DateTime.fromMillisecondsSinceEpoch(milisnd));
}

get_hours(int milisec) {
  return DateFormat("dd").format(DateTime.fromMillisecondsSinceEpoch(milisec));
}
