import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_assigned_app/Chat/Chat_rooms.dart';
import 'package:task_assigned_app/Helper/Method_Helper.dart';
import 'package:task_assigned_app/main.dart';
import 'package:task_assigned_app/views/Customized_User.dart';
import 'package:task_assigned_app/views/New_or_Old_Users.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: Colors.amber[700],
        title: Center(
            child: Text(
          'Admin Panel',
          style: TextStyle(fontSize: height / 25),
        )),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/bg.png'), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              )),
          Column(
            children: [
               SizedBox(
                height: height*100/height,
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       Get.to(Add_Pakage());
              //     },
              //     child: Center(child: Text("Add Pakage"))),
              // const SizedBox(
              //   height: 10,
              // ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(const customized_user());
                  },
                  child: Center(child: Text("Users"))),
              SizedBox(
                height: height*10/height,
              ),
              ElevatedButton(
                  onPressed: () {
                    nxt_page(Chat_rooms());
                  },
                  child: Center(child: Text("Chat"))),
               SizedBox(
                height: height*10/height,
              ),
              ElevatedButton(
                  onPressed: () {
                    nxt_page(New_or_Old_Users());
                  },
                  child: Center(child: Text("New or old Users"))),
            ],
          )
        ],
      ),
    );
  }
}
