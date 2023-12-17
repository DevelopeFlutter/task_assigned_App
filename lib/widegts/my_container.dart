// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_assigned_app/main.dart';

class my_container extends StatelessWidget {
  final Color border_color;
  final double? rardious, Width, height;
  final Widget widget;

  my_container(
      {super.key,
      this.border_color = Colors.black26,
      this.rardious,
      required this.Width,
      this.height = 60,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: border_color),
        borderRadius: BorderRadius.circular(width*20/width),
      ),
      child: widget,
    );
  }
}
