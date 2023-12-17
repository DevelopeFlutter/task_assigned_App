// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';



class Utils{

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          duration: Duration(seconds: 2),
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.all(15),
          flushbarPosition: FlushbarPosition.TOP,
          reverseAnimationCurve: Curves.easeInOut,
          message: message,
          borderRadius: BorderRadius.circular(20),
          positionOffset: 20,
          icon: Icon(
            Icons.error,
            size: 30,
            color: Colors.white,
          ),
          backgroundColor:Color.fromARGB(255, 250, 191, 16),
        )..show(context));
  }
}



progress(BuildContext context)
{
  showDialog(
    barrierDismissible: false,
    context: context,
    builder:  (context) {
      return const Center(child: CircularProgressIndicator());
    },
  );

}


