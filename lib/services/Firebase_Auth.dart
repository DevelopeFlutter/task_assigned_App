// ignore_for_file: file_names, avoid_print, unnecessary_null_comparison, prefer_const_constructors, unnecessary_string_interpolations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task_assigned_app/views/task_assigned_view.dart';

class AuthServices {
  Future<UserCredential?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      }
      print(e.toString());
      return null;
    }
  }

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential != null) {
        Get.snackbar('Sucessful', 'Login Sucessful');
          Get.to(TaskAssignedView());
      }
      return userCredential;
    } catch (e) {
      print('$e This error is from ${e}');
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
        // Handle other FirebaseAuthException codes here
      }
      Get.snackbar('Error message', '${e.toString()}');
      // print(e.toString());
      return null;
    }
  }
}
