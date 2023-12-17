import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_assigned_app/main.dart';

class my_input_field extends StatelessWidget {
  final controler;
  final String label;

  my_input_field({super.key, required this.label, required this.controler});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      controller: controler,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          focusColor: Colors.white,
          labelText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(width * 20 / width),
          )),
    );
  }
}
