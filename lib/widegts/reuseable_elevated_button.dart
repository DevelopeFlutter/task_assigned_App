// ignore_for_file: prefer_const_constructors, sort_child_properties_last, file_names, non_constant_identifier_names
import 'package:flutter/material.dart';

import '../main.dart';

Widget elevatedButton(
  onpress,
  text,
) {
  return SizedBox(
    height: height / 14,
    width: width * 0.70,
    child: ElevatedButton(
      onPressed: onpress,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: height * 15 / height),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0xFF182a48)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 30 / width),
          ))),
    ),
  );
}

customeContainer(text, packagename, days) {
  return Container(
    width: width * 0.8, // Adjust the width as needed
    height: height / 100, // Adjust the height as needed
    decoration: BoxDecoration(
      border: Border.all(color: Colors.amberAccent, width: width * 2.4 / width),
      // borderRadius: BorderRadius.circular(20),
      color: Color.fromARGB(255, 243, 237, 219),

      // shape: BoxShape.circle,
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(width * 5 / width),
                  bottomRight: Radius.circular(width * 5 / width)),
              color: Colors.amber,
            ),
            height: height * 60 / height,
            width: width * 70 / width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PKG 0${text}',
                  style: TextStyle(
                      fontSize: height * 16 / height,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  days,
                  style: TextStyle(
                      fontSize: height * 12 / height,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 10 / width),
            child: Container(
              width: width * 60 / width,
              child: Text(
                packagename,
                maxLines: 2,
                style: TextStyle(
                    fontSize: height * 12 / height,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

customDivider() {
  return Divider(
    color: Color.fromARGB(255, 250, 234, 180),
    thickness: height * 3 / height,
    indent: width * 0.16,
    endIndent: width * 0.17,
  );
}

Widget LoginSignuplEvatedButton(
  onpress,
  text,
) {
  return SizedBox(
    height: height / 15,
    width: width * 0.8,
    child: ElevatedButton(
      onPressed: onpress,
      child: Text(
        text,
        style: TextStyle(
            color: text == 'LOGIN.......!' ? Colors.white : Color.fromARGB(255, 35, 36, 36),
            fontSize: height * 22 / height),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(text == 'LOGIN.......!'
              ? Color(0xFF182a48)
              : Colors.white.withOpacity(0.7)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xFF182a48), // Set your desired border color
              width: text == 'SIGN UP.......!'
                  ? 1.0
                  : 0, // Adjust border width as needed
            ),
            borderRadius: BorderRadius.circular(width * 18 / width),
          ))),
    ),
  );
}
