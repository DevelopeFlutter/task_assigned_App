// ignore_for_file: must_be_immutable, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:task_assigned_app/main.dart';

import 'responsive_widgtes.dart';

class ReuseableTextField extends StatefulWidget {
  ReuseableTextField(
      {required this.Controller,
      required this.hintText,
      required this.icon,
      required this.obsecureText,
      this.validator,
      this.onchanged});
  TextEditingController Controller;
  String? hintText = '';
  dynamic icon;
  dynamic obsecureText;
  dynamic validator;
  dynamic onchanged;

  @override
  State<ReuseableTextField> createState() => _ReuseableTextFieldState();
}

class _ReuseableTextFieldState extends State<ReuseableTextField> {
  dynamic password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 20 / width,
        right: width * 20 / width,
      ),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.black,

          borderRadius: BorderRadius.circular(width*25/width),
          // color: const Color.fromRGBO(255, 248, 225, 1),
        ),
        height: height / 20,
        child: Center(
          child: TextField(
            // autofocus: true,
            textAlign: TextAlign.start,
            style: TextStyle(color: Color(0xFF182a48)),
            obscureText: widget.obsecureText,
            controller: widget.Controller,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: height * 2 / height, horizontal: width * 0.04),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width*25/width),
                  borderSide: BorderSide(width: 1, color: Color(0xFF182a48)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width*25/width),
                  borderSide: BorderSide(
                    width: width*1/width,
                    color: Color(0xFF182a48),
                  ),
                ),
                prefixIcon: widget.icon,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: Color(0xFF182a48),
                    fontSize: height / 40,
                    fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width*25/width),
                )),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return "${widget.hintText}  Required";
            //   }
            //   if (widget.hintText == "email" || widget.hintText == "Email") {
            //     if (!value.contains("@") || !value.contains(".com")) {
            //       return ("Email must be valid");
            //     }
            //   }
            //   if (widget.hintText == "Confirm Password") {
            //     print(
            //         '${password} ${widget.Controller.text} This is the controller');
            //     if (password == widget.Controller) {
            //       return ("Password must be matched");
            //     }
            //   }
            //   return null;
            // },
            onChanged: widget.onchanged,
          ),
        ),
      ),
    );
  }
}

CustomeTextSpan(text, fontsize, fontweight) {
  return TextSpan(
      text: text,
      style: TextStyle(
        color: Color(0xFF182a48),
        fontSize: fontsize,
        fontWeight: fontweight,
      ));
}
