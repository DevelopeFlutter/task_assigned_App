import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_assigned_app/main.dart';

class my_txt extends StatelessWidget {

  final String txt;
  final Color txt_color;
  final double? txt_size;
  final FontWeight fontWeight;

  my_txt({super.key, required this.txt,  this.txt_color=Colors.black, this.txt_size, this.fontWeight=FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,style: TextStyle(
        color: txt_color,fontWeight: fontWeight,fontSize: height*15/height),
    );
  }

}
