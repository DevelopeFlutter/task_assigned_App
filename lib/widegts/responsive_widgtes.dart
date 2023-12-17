// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:task_assigned_app/main.dart';

custTextwithStyle({text, fontsize, fontweight, color}) {
  return Text(
    text,
    style: TextStyle(fontSize: fontsize, fontWeight: fontweight, color: color),
  );
}

class ResponsivePadding extends StatelessWidget {
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  Widget child;

  ResponsivePadding(
      {required this.leftPadding,
      required this.rightPadding,
      required this.topPadding,
      required this.bottomPadding,
      required this.child});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final left = screenWidth * leftPadding;
    final right = screenWidth * rightPadding;
    final top = screenHeight * topPadding;
    final bottom = screenHeight * bottomPadding;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        left,
        top,
        right,
        bottom,
      ),
      child: child,
    );
  }
}

verticalPadding(height) {
  return SizedBox(
    height: height,
  );
}

horizontalPadding(width) {
  return SizedBox(width: width);
}



